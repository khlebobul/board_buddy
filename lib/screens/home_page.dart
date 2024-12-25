import 'package:board_buddy/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gen_art_bg/gen_art_bg.dart';
import 'package:use_scramble/use_scramble.dart';
import '../theme/app_colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final menuItems = [
      S.of(context).about,
      S.of(context).games,
      S.of(context).rules,
      S.of(context).settings,
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child:
                // Still thinking about this one
                // AsciiCube(
                //   backgroundColor: AppColors.background,
                //   textColor: AppColors.ascii,
                //   animationSpeed: 1.0,
                //   scale: 0.9,
                //   showDots: true,
                //   edgeChars: ['#', '#', '#', '#', '#', '#'],
                //   dotChar: '%',
                // ),
                BubbleField(
              backgroundColor: AppColors.background,
              circleColor: AppColors.ascii.withOpacity(0.3),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 12),
                    TextScramble(
                      text: S.of(context).boardBuddy,
                      style: textTheme.displayMedium,
                    ),
                    const Spacer(),
                    ...menuItems.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: TextScramble(
                          text: item,
                          style: textTheme.displayLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
