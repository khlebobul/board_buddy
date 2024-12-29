import '../library.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const link = 'https://khlebobul.github.io';
  static const myWebSitelink = 'https://khlebobul.github.io';
  static const telegramLink = 'https://t.me/khlebobul_dev';
  static const xLink = 'https://twitter.com/khlebobul';
  static const githubLink = 'https://github.com/khlebobul/board_buddy';
  static const webSitelink = 'https://boardbuddyapp.vercel.app';

  static const email = 'khlebobul@gmail.com';
  static const appName = 'board buddy';

  // TODO fix rate link
  static const rateAppStore =
      'https://itunes.apple.com/app/id6737812039?action=write-review';
  static const rateGooglePlay =
      'https://play.google.com/store/apps/details?hl=ru&gl=ru&id=com.khlebobul.knights_graph';

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
          leftButtonText: S.of(context).back,
          onLeftButtonPressed: () => Navigator.pop(context),
          rightButtonText: S.of(context).about,
          onRightButtonPressed: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12) +
              const EdgeInsets.only(top: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).heyMyNameIsGleb,
                style: theme.display2.copyWith(color: theme.secondaryTextColor),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: appName,
                      style: theme.display2.copyWith(
                        color: theme.redColor,
                      ),
                    ),
                    TextSpan(
                      text: S
                          .of(context)
                          .letsYouTrackScoresAndKeyMomentsEffortlesslyKeepingYour,
                      style: theme.display2.copyWith(
                        color: theme.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(height: 10),
              LinkBtnWidget(
                text: S.of(context).rateTheApp,
                url: Platform.isIOS ? rateAppStore : rateGooglePlay,
              ),
              LinkBtnWidget(
                text: S.of(context).projectWebsite,
                url: webSitelink,
              ),
              LinkBtnWidget(
                text: S.of(context).telegram,
                url: telegramLink,
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).dontHaveYourFavouriteGameEmailMe,
                style: theme.display2.copyWith(color: theme.secondaryTextColor),
              ),
              GestureDetector(
                onTap: () => _sendEmail(context, 'game request'),
                child: Text(
                  email,
                  style: theme.display2.copyWith(
                    color: theme.redColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).sinceThisIsAnOpenSourceProjectYouCanLeave,
                style: theme.display2.copyWith(color: theme.secondaryTextColor),
              ),
              LinkBtnWidget(
                text: S.of(context).githubRepository,
                url: githubLink,
              ),
              const SizedBox(height: 10),
              LinkBtnWidget(
                text: S.of(context).followMeOnXTwitter,
                url: xLink,
              ),
              LinkBtnWidget(
                text: S.of(context).checkMyWebsite,
                url: myWebSitelink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _sendEmail(BuildContext context, String subject) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'khlebobul@gmail.com',
    queryParameters: {
      'subject': subject,
    },
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    await Clipboard.setData(const ClipboardData(text: AboutScreen.email));
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      // ignore: use_build_context_synchronously
      SnackBar(content: Text(S.of(context).emailCopied)),
    );
  }
}
