import '../library.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leftButtonText: S.of(context).back,
          onLeftButtonPressed: () => Navigator.pop(context),
          rightButtonText: S.of(context).games,
          onRightButtonPressed: () {}),
    );
  }
}
