import '../library.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leftButtonText: S.of(context).back,
          onLeftButtonPressed: () => Navigator.pop(context),
          rightButtonText: S.of(context).settings,
          onRightButtonPressed: () {}),
    );
  }
}
