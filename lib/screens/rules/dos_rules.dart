import '../../utils/library.dart';

class DosRulesScreen extends StatelessWidget {
  const DosRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).dos,
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
                  dosAge,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                Text(
                  dosPlayers,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 20),
                Text(
                  'цель игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  'избавиться от всех своих карт и набрать очки за карты, оставшиеся у соперников. побеждает игрок, набравший 200 очков.',
                  style: theme.display2.copyWith(color: theme.textColor),
                ),
                const SizedBox(height: 15),
                Text(
                  'подготовка:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText: 'каждому игроку раздается по 7 карт.'),
                const BulletPointText(
                    contentText: 'выкладываются 2 карты в «центральный ряд».'),
                const BulletPointText(
                    contentText:
                        'остальная колода кладется рядом (колода для добора).'),
                const SizedBox(height: 15),
                Text(
                  'ход игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    pointSimbol: bulletOne,
                    contentText:
                        'игроки по очереди подбирают карты из руки к картам в «центральном ряду»:'),
                const BulletPointText(
                    contentText:
                        'одиночное совпадение: карта совпадает по числу.'),
                const BulletPointText(
                    contentText:
                        'двойное совпадение: сумма двух ваших карт равна числу карты из ряда.'),
                const BulletPointText(
                    pointSimbol: bulletTwo,
                    contentText:
                        'если подходящих карт нет, возьмите карту из колоды. если она подходит, можно сыграть.'),
                const BulletPointText(
                    pointSimbol: bulletThree,
                    contentText:
                        'в конце хода дополните «центральный ряд» до 2 карт.'),
                const SizedBox(height: 15),
                Text(
                  'бонусы:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'за совпадение по числу и цвету: добавьте 1 карту из руки в «центральный ряд».'),
                const BulletPointText(
                    contentText:
                        'за двойное совпадение цвета: остальные игроки берут по 1 карте из колоды.'),
                const SizedBox(height: 15),
                Text(
                  'особые карты:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        '«дикая карта dos»: заменяет две карты любого цвета.'),
                const BulletPointText(
                    contentText:
                        '«дикая карта #»: заменяет любое число (1–10) своего цвета.'),
                const SizedBox(height: 15),
                Text(
                  'особое правило:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  'если у вас осталось 2 карты, крикните «дос!». если забудете и другой игрок заметит, возьмите 2 карты.',
                  style: theme.display2,
                ),
                const SizedBox(height: 15),
                Text(
                  'подсчет очков:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(contentText: 'цифровые карты: номинал.'),
                const BulletPointText(
                    contentText: '«дикая карта dos»: 20 очков.'),
                const BulletPointText(
                    contentText: '«дикая карта #»: 40 очков.'),
                const SizedBox(height: 15),
                Text(
                  'победа:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  'игрок выигрывает, набрав 200 очков.',
                  style: theme.display2,
                ),
                const SizedBox(height: 20),
                Text(
                  'dos® является зарегистрированной торговой маркой компании mattel',
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
