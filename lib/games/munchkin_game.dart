import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';


class MunchkinGame extends StatelessWidget {
  const MunchkinGame({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).munchkin,
        onRightButtonPressed: () {},
      ),
    );
  }
}
