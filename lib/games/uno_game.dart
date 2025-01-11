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
                buttonText: '2',
                onPressed: () {},
              ),
              KeyboardButton(
                buttonText: '3',
                onPressed: () {},
              ),
              KeyboardButton(
                buttonText: '4',
                onPressed: () {},
              ),
            ],
            [
              KeyboardButton(
                buttonText: '5',
                onPressed: () {},
              ),
              KeyboardButton(
                buttonText: '6',
                onPressed: () {},
              ),
              KeyboardButton(
                buttonText: '7',
                onPressed: () {},
              ),
              KeyboardButton(
                buttonText: '8',
                onPressed: () {},
              ),
            ],
            [
              KeyboardButton(
                buttonText: '9',
                onPressed: () {},
              ),
              KeyboardButton(
                buttonText: '0',
                onPressed: () {},
              ),
              KeyboardButton(
                buttonText: 'x',
                onPressed: () {},
              ),
              KeyboardButton(
                buttonText: 'y',
                onPressed: () {},
              ),
            ],
          ],
        ),
      ),
    );
  }
}
