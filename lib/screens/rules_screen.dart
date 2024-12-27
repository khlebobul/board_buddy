import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leftButtonText: S.of(context).back,
          onLeftButtonPressed: () => Navigator.pop(context),
          rightButtonText: S.of(context).rules,
          onRightButtonPressed: () {}),
    );
  }
}
