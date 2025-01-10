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
      body: CustomKeyboard(
        buttons: [
          [
            KeyboardButton(
              child: Text('1'),
              onPressed: () => print('1 pressed'),
            ),
            KeyboardButton(
              child: Text('2'),
              onPressed: () => print('2 pressed'),
            ),
            KeyboardButton(
              child: Text('3'),
              onPressed: () => print('3 pressed'),
            ),
          ],
          [
            KeyboardButton(
              child: Text('4'),
              onPressed: () => print('4 pressed'),
            ),
            KeyboardButton(
              child: Text('5'),
              onPressed: () => print('5 pressed'),
            ),
            KeyboardButton(
              child: Text('6'),
              onPressed: () => print('6 pressed'),
            ),
          ],
          [
            KeyboardButton(
              child: Icon(Icons.add),
              onPressed: () => print('+ pressed'),
              backgroundColor: Colors.blueAccent,
            ),
            KeyboardButton(
              child: Text('0'),
              onPressed: () => print('0 pressed'),
            ),
            KeyboardButton(
              child: Icon(Icons.remove),
              onPressed: () => print('- pressed'),
              backgroundColor: Colors.redAccent,
            ),
          ],
        ],
      ),
    );
  }
}
