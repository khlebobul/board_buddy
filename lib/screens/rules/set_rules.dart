import '../../utils/library.dart';

class SetRulesScreen extends StatelessWidget {
  const SetRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).set,
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
                  setAge,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                Text(
                  setPlayers,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 20),
                Text(
                  'цель игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  'найти сет (набор из 3 карт), где каждый признак: полностью совпадает на всех картах, или полностью различается на всех картах.',
                  style: theme.display2.copyWith(color: theme.textColor),
                ),
                const SizedBox(height: 15),
                Text(
                  'признаки карт:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  'каждая карта уникальна и имеет 4 признака:',
                  style: theme.display2,
                ),
                const BulletPointText(
                    pointSimbol: bulletOne,
                    contentText: 'количество символов: 1, 2 или 3.'),
                const BulletPointText(
                    pointSimbol: bulletTwo,
                    contentText: 'тип символов: овал, ромб, волна.'),
                const BulletPointText(
                    pointSimbol: bulletThree,
                    contentText:
                        'цвет символов: красный, зеленый, фиолетовый.'),
                const BulletPointText(
                    pointSimbol: bulletFour,
                    contentText:
                        'заполнение: пустое, заштрихованное, закрашенное.'),
                const SizedBox(height: 15),
                Text(
                  'ход игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    pointSimbol: bulletOne,
                    contentText: 'раздающий выкладывает 12 карт.'),
                const BulletPointText(
                    pointSimbol: bulletTwo,
                    contentText:
                        'игроки одновременно ищут сет. кто первым находит, объявляет: «сет!».'),
                const BulletPointText(
                    pointSimbol: bulletThree,
                    contentText:
                        'проверяется правильность: если верно, игрок забирает карты, раздающий добавляет 3 новые. если ошибка, игрок теряет 1 очко или пропускает ход (по договоренности).'),
                const BulletPointText(
                    pointSimbol: bulletFour, contentText: 'игра продолжается.'),
                const SizedBox(height: 15),
                Text(
                  'пример правильного сета:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'признак «цвет»: разный (красный, зеленый, фиолетовый).'),
                const BulletPointText(
                    contentText: 'признак «количество»: одинаковый (два).'),
                const BulletPointText(
                    contentText: 'признак «тип»: разный (овал, ромб, волна).'),
                const BulletPointText(
                    contentText:
                        'признак «заполнение»: одинаковое (заштрихованное).'),
                const SizedBox(height: 15),
                Text(
                  'что делать, если сет не найден:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'если среди 12 карт сета нет, раздающий добавляет 3 карты (максимум до 21 карты). среди 21 карты сет есть всегда.'),
                const SizedBox(height: 15),
                Text(
                  'подсчет очков:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText: 'за каждый найденный сет — 1 очко.'),
                const BulletPointText(
                    contentText:
                        'игра заканчивается, когда карты в колоде заканчиваются или достигнуто оговоренное количество очков.'),
                const SizedBox(height: 15),
                Text(
                  'важные правила:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'новый сет нельзя объявлять, пока предыдущий не подтвержден.'),
                const BulletPointText(
                    contentText:
                        'карты, образующие сет, могут располагаться как угодно.'),
                const BulletPointText(
                    contentText:
                        'для обучения можно упростить игру, используя только 3 признака.'),
                const SizedBox(height: 20),
                Text(
                  'set® является зарегистрированной торговой маркой компании set enterprises, inc.',
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
