class Player {
  String name;
  final int id;
  int score;

  Player({
    required this.name,
    required this.id,
    this.score = 0,
  });

  Player copyWith({
    String? name,
    int? id,
    int? score,
  }) {
    return Player(
      name: name ?? this.name,
      id: id ?? this.id,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'score': score,
    };
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'] as String,
      id: json['id'] as int,
      score: json['score'] as int? ?? 0,
    );
  }

  @override
  String toString() => 'Player(name: $name, id: $id, score: $score)';
}
