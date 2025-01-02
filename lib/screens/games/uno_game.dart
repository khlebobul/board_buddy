import '../../utils/library.dart';

class UnoGame extends StatelessWidget {
  const UnoGame({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = UIThemes.of(context);
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
