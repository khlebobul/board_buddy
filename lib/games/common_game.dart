import '../utils/library.dart';

class CommonGame extends StatefulWidget {
  const CommonGame({super.key});
  @override
  CommonGameState createState() => CommonGameState();
}

class CommonGameState extends State<CommonGame> {
  int _currentPlayer = 1;

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).common,
        onRightButtonPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Player: $_currentPlayer',
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 12),
            // TODO make separate widget for this
            PlayerPicker(
              maxPlayers: 10,
              onValueChanged: (value) {
                setState(() {
                  _currentPlayer = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
