class Player {
  String name;
  final int id;
  int score;

  Player({
    required this.name,
    required this.id,
    this.score = 0,
  });

  @override
  String toString() {
    return 'Player(name: $name, id: $id, score: $score)';
  }
}
