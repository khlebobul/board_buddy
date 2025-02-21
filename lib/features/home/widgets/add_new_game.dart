import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/config/utils/useful_methods.dart';
import 'package:flutter/material.dart';
import 'package:use_scramble/use_scramble.dart';

/// widget that allows users to request their favorite game
class AddFavouriteGame extends StatelessWidget {
  const AddFavouriteGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).dontHaveYourFavouriteGameEmailMe,
          style: theme.display2.copyWith(color: theme.secondaryTextColor),
        ),
        GestureDetector(
          onTap: () => sendEmail(context, GeneralConst.email, MailSubjectConst.gameRequest),
          child: TextScramble(
            text: GeneralConst.email,
            style: theme.display2.copyWith(
              color: theme.redColor,
            ),
          ),
        ),
      ],
    );
  }
}
