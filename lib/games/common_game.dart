// ignore_for_file: deprecated_member_use

import '../utils/library.dart';

class CommonGame extends StatefulWidget {
  const CommonGame({super.key});

  @override
  CommonGameState createState() => CommonGameState();
}

class CommonGameState extends State<CommonGame> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12) +
              const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TODO add timer
                  SvgPicture.asset(
                    CustomIcons.play,
                    width: 25,
                    height: 25,
                    color: theme.textColor,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    '00:00',
                    style: theme.display4,
                  ),
                  const SizedBox(width: 15),
                  SvgPicture.asset(
                    CustomIcons.refresh,
                    width: 25,
                    height: 25,
                    color: theme.textColor,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => DiceModal.show(context),
                    child: SvgPicture.asset(
                      CustomIcons.dice,
                      width: 27,
                      height: 27,
                      color: theme.textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
