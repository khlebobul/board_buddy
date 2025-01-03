import '../utils/library.dart';

class CommonGame extends StatelessWidget {
  const CommonGame({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).common,
        onRightButtonPressed: () {},
      ),
      body: Center(
        // TODO make separate widget
        // TODO state management
        child: PlayerPicker(
          maxPlayers: 10,
          onValueChanged: (value) {
            debugPrint('Selected player: $value');
          },
        ),
      ),
    );
  }
}
