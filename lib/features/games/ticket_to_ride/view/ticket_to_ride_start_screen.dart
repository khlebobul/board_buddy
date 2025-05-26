import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/game_widgets/llm_models_widget.dart';
import 'package:flutter/material.dart';

class TicketToRideStartScreen extends StatelessWidget {
  const TicketToRideStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      backgroundColor: theme.bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(S.of(context).ticketToRide),
          LlmModelsWidget(),
        ],
      ),
    );
  }
}
