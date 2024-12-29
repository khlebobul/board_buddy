import '../utils/library.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        leftButtonText: S.of(context).back,
        onLeftButtonPressed: () => Navigator.pop(context),
        rightButtonText: S.of(context).about,
        onRightButtonPressed: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12) +
                const EdgeInsets.only(top: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).heyMyNameIsGleb,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
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
                  S.of(context).sinceThisIsAnOpenSourceProjectYouCanLeave,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                LinkBtnWidget(
                  text: S.of(context).githubRepository,
                  url: githubLink,
                ),
                const SizedBox(height: 10),
                const AddFavouriteGame(),
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
      ),
    );
  }
}
