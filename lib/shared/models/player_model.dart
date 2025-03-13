class PlayerModifiers {
  String? race1;
  String? race2;
  String? class1;
  String? class2;
  String? leftHand;
  String? twoHanded;
  String? rightHand;
  String? firstBonus;
  String? secondBonus;
  String? headGear;
  String? armour;
  String? boots;

  PlayerModifiers({
    this.race1,
    this.race2,
    this.class1,
    this.class2,
    this.leftHand,
    this.twoHanded,
    this.rightHand,
    this.firstBonus,
    this.secondBonus,
    this.headGear,
    this.armour,
    this.boots,
  });

  PlayerModifiers copyWith({
    String? race1,
    String? race2,
    String? class1,
    String? class2,
    String? leftHand,
    String? twoHanded,
    String? rightHand,
    String? firstBonus,
    String? secondBonus,
    String? headGear,
    String? armour,
    String? boots,
  }) {
    return PlayerModifiers(
      race1: race1 ?? this.race1,
      race2: race2 ?? this.race2,
      class1: class1 ?? this.class1,
      class2: class2 ?? this.class2,
      leftHand: leftHand ?? this.leftHand,
      twoHanded: twoHanded ?? this.twoHanded,
      rightHand: rightHand ?? this.rightHand,
      firstBonus: firstBonus ?? this.firstBonus,
      secondBonus: secondBonus ?? this.secondBonus,
      headGear: headGear ?? this.headGear,
      armour: armour ?? this.armour,
      boots: boots ?? this.boots,
    );
  }
}

class Player {
  String name;
  final int id;
  int score;
  int gear;
  int level;
  PlayerModifiers modifiers;

  Player({
    required this.name,
    required this.id,
    this.score = 0,
    this.gear = 0,
    this.level = 1,
    PlayerModifiers? modifiers,
  }) : modifiers = modifiers ?? PlayerModifiers();

  @override
  String toString() {
    return 'Player(name: $name, id: $id, score: $score, gear: $gear, level: $level)';
  }
}
