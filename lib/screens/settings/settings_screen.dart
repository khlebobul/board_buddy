import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/screens/settings/bloc/settings_bloc.dart';
import 'package:board_buddy/services/language_service.dart';
import 'package:board_buddy/services/preferences_service.dart';
import 'package:board_buddy/services/theme_service.dart';
import 'package:board_buddy/theme/app_theme.dart';
import 'package:board_buddy/utils/app_constants.dart';
import 'package:board_buddy/utils/useful_methods.dart';
import 'package:board_buddy/widgets/add_new_game.dart';
import 'package:board_buddy/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_scramble/use_scramble.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(
        preferencesService: PreferencesService(),
        themeService: ThemeService(),
      )..add(LoadSettings()),
      child: const SettingsScreenView(),
    );
  }
}

class SettingsScreenView extends StatelessWidget {
  const SettingsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: CustomAppBar(
            leftButtonText: S.of(context).back,
            onLeftButtonPressed: () => Navigator.pop(context),
            rightButtonText: S.of(context).settings,
            onRightButtonPressed: () {},
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12) +
                  const EdgeInsets.only(top: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).languages,
                    style: theme.display2
                        .copyWith(color: theme.secondaryTextColor),
                  ),
                  _buildLanguageOption(
                      context, S.of(context).english, 'en', state),
                  _buildLanguageOption(
                      context, S.of(context).russian, 'ru', state),
                  const SizedBox(height: 12),
                  Text(
                    S.of(context).theme,
                    style: theme.display2
                        .copyWith(color: theme.secondaryTextColor),
                  ),
                  _buildThemeOption(context, S.of(context).light, false, state),
                  _buildThemeOption(context, S.of(context).dark, true, state),
                  const SizedBox(height: 12),
                  Text(
                    S.of(context).others,
                    style: theme.display2
                        .copyWith(color: theme.secondaryTextColor),
                  ),
                  _buildMailOption(
                    context,
                    S.of(context).reportABug,
                    bug,
                  ),
                  _buildMailOption(
                    context,
                    S.of(context).shareFeedback,
                    feedback,
                  ),
                  _buildMailOption(
                    context,
                    S.of(context).featureRequest,
                    feature,
                  ),
                  const Spacer(),
                  const AddFavouriteGame(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    String languageName,
    String languageCode,
    SettingsState state,
  ) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () {
        context.read<SettingsBloc>().add(ChangeLanguage(languageCode));
        LanguageService.changeLanguage(context, languageCode);
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: state.selectedLanguage == languageCode
                ? theme.redColor
                : Colors.transparent,
            radius: 3,
          ),
          const SizedBox(width: 8),
          TextScramble(
            text: languageName,
            style: theme.display2,
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    String themeName,
    bool isDarkMode,
    SettingsState state,
  ) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () {
        context.read<SettingsBloc>().add(ChangeTheme(isDarkMode));
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: state.isDarkModeEnabled == isDarkMode
                ? theme.redColor
                : Colors.transparent,
            radius: 3,
          ),
          const SizedBox(width: 8),
          TextScramble(
            text: themeName,
            style: theme.display2,
          ),
        ],
      ),
    );
  }

  Widget _buildMailOption(BuildContext context, String label, String subject) {
    final theme = UIThemes.of(context);
    return GestureDetector(
      onTap: () => sendEmail(context, email, subject),
      child: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: TextScramble(
          text: label,
          style: theme.display2,
        ),
      ),
    );
  }
}
