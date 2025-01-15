import 'package:board_buddy/screens/home_screen.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:use_scramble/use_scramble.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    Future.delayed(const Duration(milliseconds: 2500), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      backgroundColor: theme.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextScramble(
              text: splashScreenOne,
              style: theme.display1.copyWith(color: theme.redColor),
            ),
            TextScramble(
              text: splashScreenTwo,
              style: theme.display1,
            ),
            TextScramble(
              text: splashScreenThree,
              style: theme.display1,
            ),
          ],
        ),
      ),
    );
  }
}
