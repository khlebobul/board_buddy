import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:board_buddy/shared/models/player_model.dart';

class DatabaseService {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'board_buddy.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        // Game sessions table
        await db.execute('''
          CREATE TABLE game_sessions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            game_type TEXT NOT NULL,
            score_limit INTEGER NOT NULL,
            game_mode TEXT NOT NULL,
            created_at INTEGER NOT NULL
          )
        ''');

        // Players table
        await db.execute('''
          CREATE TABLE players (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            session_id INTEGER NOT NULL,
            name TEXT NOT NULL,
            score INTEGER NOT NULL,
            player_index INTEGER NOT NULL,
            FOREIGN KEY (session_id) REFERENCES game_sessions (id) ON DELETE CASCADE
          )
        ''');

        // Player score history table
        await db.execute('''
          CREATE TABLE player_score_history (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            session_id INTEGER NOT NULL,
            player_index INTEGER NOT NULL,
            score_change INTEGER NOT NULL,
            history_index INTEGER NOT NULL,
            FOREIGN KEY (session_id) REFERENCES game_sessions (id) ON DELETE CASCADE
          )
        ''');
      },
    );
  }

  // Save a game session
  static Future<int> saveGameSession({
    required String gameType,
    required int scoreLimit,
    required String gameMode,
    required List<Player> players,
    required Map<int, List<int>> playerScoreHistory,
  }) async {
    final db = await database;

    // Begin transaction
    return await db.transaction((txn) async {
      // Save game session
      final sessionId = await txn.insert('game_sessions', {
        'game_type': gameType,
        'score_limit': scoreLimit,
        'game_mode': gameMode,
        'created_at': DateTime.now().millisecondsSinceEpoch,
      });

      // Save players
      for (int i = 0; i < players.length; i++) {
        final player = players[i];
        await txn.insert('players', {
          'session_id': sessionId,
          'name': player.name,
          'score': player.score,
          'player_index': i,
        });
      }

      // Save player score history
      for (final entry in playerScoreHistory.entries) {
        final playerIndex = entry.key;
        final history = entry.value;

        for (int i = 0; i < history.length; i++) {
          await txn.insert('player_score_history', {
            'session_id': sessionId,
            'player_index': playerIndex,
            'score_change': history[i],
            'history_index': i,
          });
        }
      }

      return sessionId;
    });
  }

  // Check if a game session exists
  static Future<bool> hasGameSession(String gameType) async {
    final db = await database;
    final result = await db.query(
      'game_sessions',
      where: 'game_type = ?',
      whereArgs: [gameType],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  // Get the latest game session
  static Future<Map<String, dynamic>?> getLatestGameSession(
      String gameType) async {
    final db = await database;

    final sessions = await db.query(
      'game_sessions',
      where: 'game_type = ?',
      whereArgs: [gameType],
      orderBy: 'created_at DESC',
      limit: 1,
    );

    if (sessions.isEmpty) return null;

    final sessionId = sessions.first['id'] as int;
    final session = sessions.first;

    // Get players
    final playersData = await db.query(
      'players',
      where: 'session_id = ?',
      whereArgs: [sessionId],
      orderBy: 'player_index ASC',
    );

    final players = playersData.map((playerData) {
      return Player(
        name: playerData['name'] as String,
        id: playerData['player_index'] as int,
        score: playerData['score'] as int,
      );
    }).toList();

    // Get player score history
    final historyData = await db.query(
      'player_score_history',
      where: 'session_id = ?',
      whereArgs: [sessionId],
      orderBy: 'player_index ASC, history_index ASC',
    );

    final playerScoreHistory = <int, List<int>>{};
    for (final entry in historyData) {
      final playerIndex = entry['player_index'] as int;
      final scoreChange = entry['score_change'] as int;

      if (!playerScoreHistory.containsKey(playerIndex)) {
        playerScoreHistory[playerIndex] = [];
      }

      playerScoreHistory[playerIndex]!.add(scoreChange);
    }

    return {
      'session': session,
      'players': players,
      'playerScoreHistory': playerScoreHistory,
    };
  }

  // Delete a game session
  static Future<void> deleteGameSession(String gameType) async {
    final db = await database;

    final sessions = await db.query(
      'game_sessions',
      where: 'game_type = ?',
      whereArgs: [gameType],
    );

    for (final session in sessions) {
      final sessionId = session['id'] as int;
      await db.delete(
        'game_sessions',
        where: 'id = ?',
        whereArgs: [sessionId],
      );
    }
  }
}
