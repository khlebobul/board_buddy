import 'dart:convert';
import 'package:flutter/widgets.dart';
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
      version: 2,
      onCreate: (db, version) async {
        // Game sessions table
        await db.execute('''
          CREATE TABLE game_sessions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            game_type TEXT NOT NULL,
            score_limit INTEGER NOT NULL,
            game_mode TEXT NOT NULL,
            created_at INTEGER NOT NULL,
            custom_data TEXT
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
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Add custom_data column for version 2
          await db
              .execute('ALTER TABLE game_sessions ADD COLUMN custom_data TEXT');
        }
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
    Map<String, dynamic>? customData,
  }) async {
    final db = await database;

    // Begin transaction
    return await db.transaction((txn) async {
      // Save game session
      final Map<String, dynamic> sessionData = {
        'game_type': gameType,
        'score_limit': scoreLimit,
        'game_mode': gameMode,
        'created_at': DateTime.now().millisecondsSinceEpoch,
      };

      // Add custom data if provided
      if (customData != null) {
        sessionData['custom_data'] = jsonEncode(customData);
      }

      final sessionId = await txn.insert('game_sessions', sessionData);

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

    debugPrint('Getting latest game session for $gameType');

    final sessions = await db.query(
      'game_sessions',
      where: 'game_type = ?',
      whereArgs: [gameType],
      orderBy: 'created_at DESC',
      limit: 1,
    );

    if (sessions.isEmpty) {
      debugPrint('No sessions found for $gameType');
      return null;
    }

    final sessionId = sessions.first['id'] as int;
    final session = Map<String, dynamic>.from(sessions.first);

    debugPrint('Found session with ID: $sessionId');
    debugPrint('Raw session data: ${session.toString()}');

    // Parse custom data if available
    if (session.containsKey('custom_data') && session['custom_data'] != null) {
      try {
        final customDataString = session['custom_data'] as String;
        debugPrint('Custom data string: $customDataString');

        final customData = jsonDecode(customDataString) as Map<String, dynamic>;
        debugPrint('Parsed custom data: ${customData.toString()}');

        // Merge custom data into session
        session.addAll(customData);
        debugPrint('Session after adding custom data: ${session.toString()}');
      } catch (e) {
        debugPrint('Error parsing custom data: $e');
      }
    } else {
      debugPrint('No custom_data field in session or it is null');
    }

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
        temporaryModifier: 0,
      );
    }).toList();

    debugPrint('Loaded ${players.length} players');

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

    debugPrint('Loaded score history for ${playerScoreHistory.length} players');

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

  // Save a game session with custom data
  static Future<int> saveGameSessionWithCustomData({
    required String gameType,
    required int scoreLimit,
    required String gameMode,
    required List<Player> players,
    required Map<String, dynamic> customData,
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

      // Get session to update
      final session = await txn.query(
        'game_sessions',
        where: 'id = ?',
        whereArgs: [sessionId],
      );

      if (session.isNotEmpty) {
        // Combine the session with custom data
        final Map<String, dynamic> updatedSession = Map.from(session.first);

        // Add custom data to session
        for (final entry in customData.entries) {
          updatedSession[entry.key] = entry.value;
        }

        // Return the combined data
        return sessionId;
      }

      return sessionId;
    });
  }
}
