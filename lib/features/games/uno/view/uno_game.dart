import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/models/player_model.dart';
import 'package:board_buddy/shared/widgets/ui/bottom_game_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/shared/widgets/game_widgets/player_card.dart';
import 'package:board_buddy/shared/widgets/game_widgets/players_indicator.dart';
import 'package:board_buddy/features/games/uno/widgets/info_uno_dialog_widget.dart';
import 'package:board_buddy/shared/widgets/game_widgets/points_keyboard.dart';
import 'package:board_buddy/config/utils/custom_icons.dart';
import 'package:flutter/material.dart';

/// uno game screen
class UnoGame extends StatefulWidget {
  final List<Player> players;
  final int scoreLimit;
  final String gameMode;

  const UnoGame({
    super.key,
    required this.players,
    required this.scoreLimit,
    required this.gameMode,
  });

  @override
  State<UnoGame> createState() => _UnoGameState();
}

class _UnoGameState extends State<UnoGame> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final page = _pageController.page?.round() ?? 0;
    if (page != _currentPage) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        isRules: true,
        rightButtonText: S.of(context).rules,
        onRightButtonPressed: () => Navigator.pushNamed(context, '/unoRules'),
      ),
      body: SafeArea(
        // players cards
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: GeneralConst.paddingHorizontal),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${S.of(context).gameUpTo}${widget.scoreLimit}',
                        style: theme.display2
                            .copyWith(color: theme.secondaryTextColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: constraints.maxHeight * 0.4,
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: widget.players.length,
                          pageSnapping: true,
                          padEnds: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: GeneralConst.paddingHorizontal / 2,
                              ),
                              child: PlayerCard(
                                player: widget.players[index],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.players.asMap().entries.map((entry) {
                          final index = entry.key;
                          final player = entry.value;
                          final firstLetter = player.name.characters.first;
                          return GestureDetector(
                            onTap: () => _goToPage(index),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: PlayerIndicator(
                                letter: firstLetter,
                                isActive: index == _currentPage,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const Spacer(),

                // points keyboard
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: GeneralConst.paddingHorizontal),
                  child: CustomKeyboard(
                    buttons: [
                      [
                        KeyboardButton(buttonText: '1'),
                        KeyboardButton(buttonText: '2'),
                        KeyboardButton(buttonText: '3'),
                        KeyboardButton(buttonText: '4'),
                      ],
                      [
                        KeyboardButton(buttonText: '5'),
                        KeyboardButton(buttonText: '6'),
                        KeyboardButton(buttonText: '7'),
                        KeyboardButton(buttonText: '8'),
                      ],
                      [
                        KeyboardButton(buttonText: '9'),
                        KeyboardButton(buttonText: '0'),
                        KeyboardButton(buttonText: '+2'),
                        KeyboardButton(buttonIcon: CustomIcons.reverse),
                      ],
                      [
                        KeyboardButton(buttonIcon: CustomIcons.skip),
                        KeyboardButton(buttonIcon: CustomIcons.wild),
                        KeyboardButton(buttonIcon: CustomIcons.wildDrawFour),
                        KeyboardButton(buttonIcon: CustomIcons.swap),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomGameBar(
        dialogWidget: const InfoUnoDialog(),
        isArrow: true,
        rightButtonText: S.of(context).finish,
      ),
    );
  }
}
