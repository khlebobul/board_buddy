import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ThousandStartScreen extends StatelessWidget {
  const ThousandStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: RulesConst.thousand,
        onRightButtonPressed: () {},
      ),
      body: const Center(
        child: Text('Thousand Start Screen'),
      ),
    );
  }
}


