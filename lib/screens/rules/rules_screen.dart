import '../../utils/library.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).rules,
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
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UnoRulesScreen(),
                  ),
                ),
                child: TextScramble(
                  text: '01 - ${S.of(context).uno}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScrabbleRulesScreen(),
                  ),
                ),
                child: TextScramble(
                  text: '02 - ${S.of(context).scrabble}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UnoFlipRulesScreen(),
                  ),
                ),
                child: TextScramble(
                  text: '03 - ${S.of(context).unoFlip}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DosRulesScreen(),
                  ),
                ),
                child: TextScramble(
                  text: '04 - ${S.of(context).dos}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SetRulesScreen(),
                  ),
                ),
                child: TextScramble(
                  text: '05 - ${S.of(context).set}',
                  style: theme.display3,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MunchkinRulesScreen(),
                  ),
                ),
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
