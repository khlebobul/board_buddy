class Player {
  String name;
  final int id;
  int score;
  int gear;
  int level;

  Player({
    required this.name,
    required this.id,
    this.score = 0,
    this.gear = 0,
    this.level = 1,
  });

  @override
  String toString() {
    return 'Player(name: $name, id: $id, score: $score, gear: $gear, level: $level)';
  }
}
