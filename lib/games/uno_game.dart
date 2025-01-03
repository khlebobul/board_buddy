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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'max points: $_currentValue',
              style: theme.display2.copyWith(color: theme.secondaryTextColor),
            ),
            const SizedBox(height: 12),
            // TODO make separate widget for this
            WheelSlider(
              interval: 1,
              totalCount: 10000,
              initValue: _currentValue,
              pointerColor: theme.redColor,
              lineColor: theme.textColor,
              pointerWidth: 2,
              onValueChanged: (val) {
                setState(() {
                  _currentValue = val;
                });
              },
              hapticFeedbackType: HapticFeedbackType.selectionClick,
            ),
          ],
        ),
      ),
    );
  }
}
