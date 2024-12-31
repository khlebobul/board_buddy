import '../../utils/library.dart';

class UnoRulesScreen extends StatelessWidget {
  const UnoRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).uno,
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
                  unoAge,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                Text(
                  unoPlayers,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 20),
                Text(
                  'цель игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  'первым избавиться от всех своих карт и набрать очки за карты, оставшиеся у соперников. побеждает игрок, набравший 500 очков.',
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
                    contentText:
                        'остальная колода кладется в центр (это колода для добора).'),
                const BulletPointText(
                    contentText:
                        'верхняя карта переворачивается (это начальная карта сброса).'),
                const SizedBox(height: 15),
                Text(
                  'ход игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    pointSimbol: bulletOne,
                    contentText:
                        'игроки по очереди сбрасывают карту, совпадающую с верхней картой по цвету, числу или символу.'),
                const BulletPointText(
                    pointSimbol: bulletTwo,
                    contentText:
                        'если подходящей карты нет, берется карта из колоды. если она подходит, можно сыграть.'),
                const BulletPointText(
                    pointSimbol: bulletThree,
                    contentText:
                        'игрок может взять карту, даже если у него есть подходящая, но использовать ее в этом ходу нельзя.'),
                const SizedBox(height: 15),
                Text(
                  'активные карты:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        '«пропусти ход»: следующий игрок пропускает ход.'),
                const BulletPointText(
                    contentText:
                        '«возьми две»: следующий игрок берет 2 карты и пропускает ход.'),
                const BulletPointText(
                    contentText:
                        '«смени направление»: меняет направление игры.'),
                const BulletPointText(
                    contentText: 'дикая карта: позволяет выбрать цвет игры.'),
                const BulletPointText(
                    contentText:
                        'дикая карта «возьми четыре»: позволяет выбрать цвет, а следующий игрок берет 4 карты. можно сыграть, только если нет других карт того же цвета.'),
                const SizedBox(height: 15),
                Text(
                  'особые карты:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        '«обмен»: обмен картами с любым игроком и выбор цвета.'),
                const BulletPointText(
                    contentText:
                        'пустая карта: придумайте правило перед игрой.'),
                const SizedBox(height: 15),
                Text(
                  'особые правила:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'забыл крикнуть «уно»? возьми 2 карты, если заметили до хода следующего игрока.'),
                const BulletPointText(
                    contentText:
                        'если кончилась колода добора, сброс перетасовывается.'),
                const SizedBox(height: 15),
                Text(
                  'подсчет очков:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text('цифровые карты: их номинал.', style: theme.display2),
                const BulletPointText(
                    contentText:
                        '«пропусти ход», «возьми две», «смени направление»: 20 очков.'),
                const BulletPointText(
                    contentText: 'дикая карта, «возьми четыре»: 50 очков.'),
                const BulletPointText(
                    contentText: '«обмен», пустая карта: 40 очков.'),
                const SizedBox(height: 15),
                Text(
                  'победа:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText: 'игрок выигрывает, набрав 500 очков.'),
                const BulletPointText(
                    contentText:
                        'альтернатива: выигрывает игрок с наименьшим количеством очков после окончания игры.'),
                const SizedBox(height: 20),
                Text(
                  'uno® является зарегистрированной торговой маркой компании mattel',
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
