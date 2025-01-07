import '../utils/library.dart';

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
          onTap: () => sendEmail(context, email, gameRequest),
          child: TextScramble(
            text: email,
            style: theme.display2.copyWith(
              color: theme.redColor,
            ),
          ),
        ),
      ],
    );
  }
}
