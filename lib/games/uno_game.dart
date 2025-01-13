import '../utils/library.dart';

class UnoGame extends StatelessWidget {
  const UnoGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).uno,
        // for testing
        onRightButtonPressed: () {},
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: PlayerCard(
          playerName: 'player 1',
          score: 0,
        ),
      ),
      bottomNavigationBar: BottomGameBar(
        leftButtonText: S.of(context).rules,
        isArrow: true,
        rightButtonText: S.of(context).rules,
      ),
    );
  }
}
