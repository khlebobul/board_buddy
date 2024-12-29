import '../utils/library.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leftButtonText: S.of(context).back,
          onLeftButtonPressed: () => Navigator.pop(context),
          rightButtonText: S.of(context).rules,
          onRightButtonPressed: () {}),
    );
  }
}
