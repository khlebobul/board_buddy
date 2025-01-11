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
        onRightButtonPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const AddPlayersBottomSheet(),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomKeyboard(
          buttons: [
            [
              KeyboardButton(
                buttonText: '1',
                onPressed: () {},
              ),
              KeyboardButton(
                buttonIcon: CustomIcons.dice,
                iconSize: 3,
                onPressed: () {},
              ),
              KeyboardButton(
                buttonIcon: CustomIcons.dice,
                iconSize: 3,
                onPressed: () {},
              ),
              KeyboardButton(
                buttonIcon: CustomIcons.dice,
                iconSize: 3,
                onPressed: () {},
              ),
              KeyboardButton(
                buttonIcon: CustomIcons.dice,
                iconSize: 3,
                onPressed: () {},
              ),
            ],
            [
              KeyboardButton(
                buttonText: '1',
                onPressed: () {},
              ),
              KeyboardButton(
                buttonIcon: CustomIcons.dice,
                iconSize: 3,
                onPressed: () {},
              ),
              KeyboardButton(
                buttonIcon: CustomIcons.dice,
                iconSize: 3,
                onPressed: () {},
              ),
              KeyboardButton(
                buttonIcon: CustomIcons.dice,
                iconSize: 3,
                onPressed: () {},
              ),
              KeyboardButton(
                buttonIcon: CustomIcons.dice,
                iconSize: 3,
                onPressed: () {},
              ),
            ],
          ],
        ),
      ),
    );
  }
}
