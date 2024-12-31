import '../../utils/library.dart';

class UnoFlipRulesScreen extends StatelessWidget {
  const UnoFlipRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).unoFlip,
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
                  unoFlipAge,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                Text(
                  unoFlipPlayers,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 20),
                Text(
                  'цель игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  'избавьтесь от всех своих карт и наберите очки за карты соперников. побеждает игрок, набравший 500 очков.',
                  style: theme.display2.copyWith(color: theme.textColor),
                ),
                const SizedBox(height: 15),
                Text(
                  'начало игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText: 'каждый игрок получает 7 карт.'),
                const BulletPointText(
                    contentText: 'игру начинают светлой стороной колоды.'),
                const SizedBox(height: 15),
                Text(
                  'ход игры:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'сыграйте карту, совпадающую по цвету, числу или символу с верхней картой сброса.'),
                const BulletPointText(
                    contentText:
                        'если подходящей карты нет, возьмите карту из колоды.'),
                const BulletPointText(
                    contentText:
                        'карта «переверните» меняет сторону игры с «светлой» на «тёмную» и наоборот.'),
                const SizedBox(height: 15),
                Text(
                  'активные карты:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                Text(
                  'светлая сторона:',
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const BulletPointText(contentText: '«возьми одну».'),
                const BulletPointText(contentText: '«смени направление».'),
                const BulletPointText(contentText: '«пропусти ход».'),
                const BulletPointText(contentText: '«дикая карта».'),
                const BulletPointText(contentText: '«дикая +2».'),
                const SizedBox(height: 10),
                Text(
                  'тёмная сторона:',
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const BulletPointText(contentText: '«возьми пять».'),
                const BulletPointText(contentText: '«смени направление».'),
                const BulletPointText(contentText: '«все пропускают ход».'),
                const BulletPointText(contentText: '«дикая карта».'),
                const BulletPointText(
                    contentText: '«бери, пока не вытянешь нужный цвет».'),
                const SizedBox(height: 15),
                Text(
                  'ключевые моменты:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'после карты «переверните» вся игра меняет сторону.'),
                const BulletPointText(
                    contentText:
                        'если игрок играет предпоследней картой, он должен сказать «уно!». если забыл, берёт 2 карты.'),
                const SizedBox(height: 15),
                Text(
                  'подсчёт очков:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'победитель раунда получает очки за оставшиеся карты соперников:'),
                const BulletPointText(
                    pointSimbol: bulletOne,
                    contentText: 'карты с цифрами: по их номиналу.'),
                const BulletPointText(
                    pointSimbol: bulletTwo,
                    contentText:
                        'активные карты: 20–60 очков в зависимости от типа.'),
                const SizedBox(height: 15),
                Text(
                  'победа:',
                  style: theme.display2.copyWith(color: theme.redColor),
                ),
                const BulletPointText(
                    contentText:
                        'игрок, набравший 500 очков, выигрывает игру.'),
                const BulletPointText(
                    contentText:
                        'альтернатива: выигрывает игрок с наименьшим количеством очков после окончания игры.'),
                const SizedBox(height: 20),
                Text(
                  'uno flip® является зарегистрированной торговой маркой компании mattel',
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
