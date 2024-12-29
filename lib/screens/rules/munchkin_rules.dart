import '../../utils/library.dart';

class MunchkinRulesScreen extends StatelessWidget {
  const MunchkinRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).munchkin,
        onRightButtonPressed: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12) +
                const EdgeInsets.only(top: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '12+',
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                Text(
                  '3-6',
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 20),
                Text(
                  'цель игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  'первым достичь 10 уровня, сражаясь с монстрами, используя карты снаряжения, проклятия и умения.',
                  style: theme.display2.copyWith(color: theme.textColor),
                ),
                const SizedBox(height: 15),
                Text(
                  'подготовка:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'перемешайте карты дверей и сокровищ и разложите их в две отдельные колоды.'),
                const BulletPointText(
                    contentText:
                        'каждый игрок берет по: 4 карты из колоды дверей и 4 карты из колоды сокровищ.'),
                const BulletPointText(
                    contentText:
                        'игроки выкладывают на стол начальные карты снаряжения, если таковые есть.'),
                const SizedBox(height: 15),
                Text(
                  'ход игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'игрок открывает верхнюю карту из колоды дверей. возможные ситуации:'),
                const BulletPointText(
                    pointSimbol: bulletOne,
                    contentText: 'монстр: сразитесь с ним (см. "бой").'),
                const BulletPointText(
                    pointSimbol: bulletTwo,
                    contentText: 'проклятие: немедленно примените его к себе.'),
                const BulletPointText(
                    pointSimbol: bulletThree,
                    contentText: 'любая другая карта: оставьте ее в руке.'),
                const BulletPointText(
                    contentText:
                        'если монстра нет, игрок может: выложить монстра из руки для боя (опционально) или залезть в "поиск неприятностей" (взять карту из колоды дверей в руку).'),
                const SizedBox(height: 10),
                Text(
                  'бой (если есть монстр):',
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const BulletPointText(
                    contentText:
                        'сравните уровень вашего персонажа (с учетом бонусов) с уровнем монстра.'),
                const BulletPointText(
                    pointSimbol: bulletOne,
                    contentText:
                        'если ваш уровень выше или равен — вы побеждаете и получаете сокровища, а также уровень.'),
                const BulletPointText(
                    pointSimbol: bulletTwo,
                    contentText:
                        'если ваш уровень меньше, можно: попросить помощи у другого игрока (по договоренности) или использовать карты из руки для усиления.'),
                const BulletPointText(
                    pointSimbol: bulletThree,
                    contentText:
                        'если вы не смогли победить, убегайте (киньте кубик). успешный побег на 5 или 6. если не сбежали, применяются последствия, указанные на карте монстра.'),
                const SizedBox(height: 10),
                const BulletPointText(
                    contentText:
                        'в конце хода сбросьте лишние карты, если их больше 5. отдайте их игроку с самым низким уровнем.'),
                const SizedBox(height: 15),
                Text(
                  'типы карт:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(contentText: 'монстры — сражайтесь с ними, чтобы повышать уровень.'),
                const BulletPointText(contentText: 'снаряжение — дает бонусы к уровню в бою.'),
                const BulletPointText(contentText: 'проклятия — ухудшают персонажа или мешают другим игрокам.'),
                const BulletPointText(contentText: 'усилители монстров — увеличивают силу монстра.'),
                const BulletPointText(contentText: 'одноразовые предметы — используются в бою или для других эффектов.'),
                const SizedBox(height: 15),
                Text(
                  'особые правила:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'победа над монстром: за победу над монстром получаете уровень и сокровища.'),
                const BulletPointText(
                    contentText:
                        'уровень 10: последний уровень можно достичь только победой над монстром.'),
                const BulletPointText(
                    contentText:
                        'смерть: игрок теряет все карты, кроме уровня и рас (или классов).'),
                const SizedBox(height: 15),
                Text(
                  'победа:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText: 'игрок, первым достигший 10 уровня, побеждает!'),
                    const SizedBox(height: 20),
                Text(
                  'munchkin® является зарегистрированной торговой маркой компании steve jackson games',
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
