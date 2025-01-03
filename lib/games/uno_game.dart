import '../utils/library.dart';

class UnoGame extends StatefulWidget {
  const UnoGame({super.key});

  @override
  UnoGameState createState() => UnoGameState();
}

class UnoGameState extends State<UnoGame> {
  int _currentValue = 500;

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
    );
  }
}
