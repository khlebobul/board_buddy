library path;

export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'dart:io';
export 'dart:math';

// packages
export '../generated/l10n.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:use_scramble/use_scramble.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:gen_art_bg/gen_art_bg.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:flutter_svg/flutter_svg.dart';

// utils
export 'app_constants.dart';
export 'useful_methods.dart';
export 'routes.dart';
export 'custom_icons.dart';

// theme
export '../theme/app_colors.dart';
export '../theme/app_theme.dart';

// widgets
export '../widgets/custom_app_bar.dart';
export '../widgets/link_btn.dart';
export '../widgets/add_new_game.dart';
export '../widgets/bullet_poit_text.dart';
export '../widgets/dice_modal.dart';
export '../widgets/timer.dart';

// screens
export '../screens/home_screen.dart';
export '../screens/about_screen.dart';
export '../screens/games_screen.dart';
export '../screens/settings/settings_screen.dart';
export '../screens/splash_screen.dart';
// rules
export '../screens/rules_screen.dart';
export '../screens/rules/uno_rules.dart';
export '../screens/rules/dos_rules.dart';
export '../screens/rules/scrabble_rules.dart';
export '../screens/rules/set_rules.dart';
export '../screens/rules/uno_flip_rules.dart';
export '../screens/rules/munchkin_rules.dart';
// games
export '../games/uno_game.dart';
export '../games/uno_flip_game.dart';
export '../games/dos_game.dart';
export '../games/scrabble_game.dart';
export '../games/set_game.dart';
export '../games/munchkin_game.dart';
export '../games/common_game.dart';

// services
export '../services/preferences_service.dart';
export '../services/language_service.dart';
export '../services/theme_service.dart';
