import '../utils/library.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).games,
        onRightButtonPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12) +
              const EdgeInsets.only(top: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/commonGame'),
                child: TextScramble(
                  text: '00 - ${S.of(context).common}',
                  style:
                      theme.display3.copyWith(color: theme.secondaryTextColor),
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/unoGame'),
                child: TextScramble(
                  text: '01 - ${S.of(context).uno}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/scrabbleGame'),
                child: TextScramble(
                  text: '02 - ${S.of(context).scrabble}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/unoFlipGame'),
                child: TextScramble(
                  text: '03 - ${S.of(context).unoFlip}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/dosGame'),
                child: TextScramble(
                  text: '04 - ${S.of(context).dos}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/setGame'),
                child: TextScramble(
                  text: '05 - ${S.of(context).set}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/munchkinGame'),
                child: TextScramble(
                  text: '06 - ${S.of(context).munchkin}',
                  style: theme.display3,
                ),
              ),
              const Spacer(),
              const AddFavouriteGame(),
            ],
          ),
        ),
      ),
    );
  }
}
