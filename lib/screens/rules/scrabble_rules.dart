import '../../utils/library.dart';

class ScrabbleRulesScreen extends StatelessWidget {
  const ScrabbleRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).scrabble,
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
                  scrabbleAge,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                Text(
                  scrabblePlayers,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 20),
                Text(
                  'цель игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  'составляйте слова на игровом поле по принципу кроссворда. заработайте больше очков, чем соперники.',
                  style: theme.display2.copyWith(color: theme.textColor),
                ),
                const SizedBox(height: 15),
                Text(
                  'комплект игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(contentText: 'поле 15 на 15 клеток.'),
                const BulletPointText(
                    contentText: '104 буквы (включая 2 пустышки).'),
                const BulletPointText(
                    contentText: '4 подставки, мешочек для букв.'),
                const SizedBox(height: 15),
                Text(
                  'подготовка к игре:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText: 'перемешайте буквы в мешочке.'),
                const BulletPointText(
                    contentText: 'каждый игрок берет 7 букв.'),
                const BulletPointText(
                    contentText:
                        'первый ход делает тот, чья случайно вытянутая буква ближе к началу алфавита.'),
                const SizedBox(height: 15),
                Text(
                  'правила хода:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    pointSimbol: bulletOne,
                    contentText:
                        'первый ход: слово должно проходить через центральную клетку (звездочка).'),
                const BulletPointText(
                    pointSimbol: bulletTwo,
                    contentText:
                        'все слова выкладываются горизонтально или вертикально.'),
                const BulletPointText(
                    pointSimbol: bulletThree,
                    contentText:
                        'каждая новая буква должна быть частью нового или существующего слова.'),
                const SizedBox(height: 15),
                Text(
                  'подсчет очков:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'очки за слово: сумма очков букв + бонусы от клеток.'),
                const BulletPointText(
                    contentText:
                        'синий цвет удваивает/утраивает очки за букву.'),
                const BulletPointText(
                    contentText:
                        'красный цвет удваивает/утраивает очки за слово.'),
                const SizedBox(height: 15),
                Text(
                  'особенности:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'пустышка заменяет любую букву, но не дает очков.'),
                const BulletPointText(
                    contentText:
                        'если использованы все 7 букв за ход, игрок получает 50 бонусных очков.'),
                const BulletPointText(
                    contentText:
                        'каждый ход игрок добирает буквы, чтобы снова иметь 7.'),
                const SizedBox(height: 15),
                Text(
                  'конец игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    pointSimbol: bulletOne,
                    contentText:
                        'закончились буквы в мешочке, и никто не может сделать ход.'),
                const BulletPointText(
                    pointSimbol: bulletTwo,
                    contentText: 'все игроки пропустили ходы дважды.'),
                const BulletPointText(
                    pointSimbol: bulletThree,
                    contentText:
                        'оставшиеся буквы на подставках вычитаются из очков.'),
                const SizedBox(height: 15),
                Text(
                  'дополнительные моменты:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText: 'можно заменить буквы, пропустив ход.'),
                const BulletPointText(
                    contentText:
                        'спорные слова проверяются в согласованном словаре.'),
                const BulletPointText(
                    contentText:
                        'все слова должны быть завершенными и соответствовать правилам языка.'),
                const SizedBox(height: 20),
                Text(
                  'scrabble® является зарегистрированной торговой маркой компании hasbro, inc.',
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
