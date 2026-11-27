import 'dart:io';

import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/shared/widgets/ui/pressable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gen_art_bg/gen_art_bg.dart';
import 'package:material_ui/material_ui.dart' as material_ui;
import 'package:upgrader/upgrader.dart';
import 'package:use_scramble/use_scramble.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Upgrader _upgrader;

  @override
  void initState() {
    super.initState();
    _upgrader = Upgrader(
      debugLogging: true,
      debugDisplayAlways: false,
    );
  }

  @override
  void dispose() {
    _upgrader.dispose();
    super.dispose();
  }

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  material_ui.ThemeData _upgradeDialogTheme(UIThemes theme) {
    final isDark = theme.isDarkTheme;
    final background = theme.bgColor;
    final foreground = theme.textColor;
    return material_ui.ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      fontFamily: 'RobotoMono',
      scaffoldBackgroundColor: background,
      colorScheme: isDark
          ? material_ui.ColorScheme.dark(
              primary: foreground,
              onPrimary: background,
              surface: background,
              onSurface: foreground,
            )
          : material_ui.ColorScheme.light(
              primary: foreground,
              onPrimary: background,
              surface: background,
              onSurface: foreground,
            ),
      dialogTheme: material_ui.DialogThemeData(backgroundColor: background),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    final menuItems = [
      {'title': S.of(context).games, 'route': '/games'},
      {'title': S.of(context).rules, 'route': '/rules'},
      {'title': S.of(context).about, 'route': '/about'},
      {'title': S.of(context).settings, 'route': '/settings'},
    ];

    final content = Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BubbleField(
              backgroundColor: theme.bgColor,
              circleColor: theme.secondaryTextColor.withValues(alpha: 0.3),
              padding: 3,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding:
                  const EdgeInsets.only(right: GeneralConst.paddingVertical),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 12),
                    TextScramble(
                        text: 'board buddy',
                        builder: (context, scrambledText) {
                          return Text(
                            scrambledText,
                            style:
                                theme.display1.copyWith(color: theme.redColor),
                          );
                        }),
                    const Spacer(),
                    ...menuItems.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Pressable(
                          onTap: () => _navigateTo(context, item['route']!),
                          child: TextScramble(
                              text: item['title']!,
                              builder: (context, scrambledText) {
                                return Text(
                                  scrambledText,
                                  style: theme.display1,
                                );
                              }),
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

    final upgradeAlert = material_ui.Theme(
      data: _upgradeDialogTheme(theme),
      child: UpgradeAlert(
        showReleaseNotes: false,
        dialogStyle: Platform.isIOS
            ? UpgradeDialogStyle.cupertino
            : UpgradeDialogStyle.material,
        cupertinoButtonTextStyle: const TextStyle(
          color: CupertinoColors.activeBlue,
          fontSize: 17,
        ),
        upgrader: _upgrader,
        child: content,
      ),
    );

    if (!Platform.isIOS) {
      return Theme(
        data: Theme.of(context).brightness == Brightness.dark
            ? UIThemes.darkTheme()
            : UIThemes.lightTheme(),
        child: upgradeAlert,
      );
    }

    return upgradeAlert;
  }
}
