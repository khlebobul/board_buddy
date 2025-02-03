import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/widgets/app_widgets/bottom_game_widget.dart';
import 'package:board_buddy/widgets/app_widgets/custom_app_bar.dart';
import 'package:board_buddy/widgets/game_widgets/custom_results_table_widget.dart';
import 'package:board_buddy/widgets/info_dialog_widgets/info_dos_dialog_widget.dart';
import 'package:flutter/material.dart';


/// dos game screen
class DosGame extends StatelessWidget {
  const DosGame({super.key});

  @override
  Widget build(BuildContext context) {
    final playersData = [
      {
        'name': 'player1',
        'scores': [100, 100, 100, 90, 95]
      },
      {
        'name': 'player2',
        'scores': [90, 80, 70, 85, 88]
      },
      {
        'name': 'player3',
        'scores': [85, 95, 100, 80, 75]
      },
      {
        'name': 'player4',
        'scores': [60, 75, 80, 70, 85]
      },
      {
        'name': 'player5',
        'scores': [88, 92, 96, 85, 80]
      },
      {
        'name': 'player6',
        'scores': [70, 85, 90, 75, 80]
      },
      {
        'name': 'player7',
        'scores': [78, 82, 84, 88, 90]
      },
      {
        'name': 'player8',
        'scores': [100, 100, 100, 95, 90]
      },
      {
        'name': 'player9',
        'scores': [65, 70, 75, 80, 85]
      },
      {
        'name': 'player10',
        'scores': [90, 88, 95, 85, 80]
      },
    ];
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        isRules: true,
        rightButtonText: S.of(context).rules,
        onRightButtonPressed: () => Navigator.pushNamed(context, '/dosRules'),
      ),
      body: ResultsTableWidget(
        playersData: playersData,
      ),
      bottomNavigationBar: BottomGameBar(
        dialogWidget: const InfoDosDialog(),
        leftButtonText: S.of(context).rules,
        isArrow: true,
        rightButtonText: S.of(context).finish,
      ),
    );
  }
}
