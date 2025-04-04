import 'dart:io';

import 'package:board_buddy/generated/l10n.dart';
import 'package:board_buddy/config/theme/app_theme.dart';
import 'package:board_buddy/config/constants/app_constants.dart';
import 'package:board_buddy/features/home/widgets/add_new_game.dart';
import 'package:board_buddy/features/about/widgets/contributors_widget.dart';
import 'package:board_buddy/shared/widgets/ui/custom_app_bar.dart';
import 'package:board_buddy/features/about/widgets/link_btn.dart';
import 'package:board_buddy/shared/services/review_service.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
    _requestReview();
  }

  Future<void> _requestReview() async {
    await ReviewService.incrementTimesCount();
    await ReviewService.requestReview();
  }

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final urlPreview = AppLnksConst.webSitelink;
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
            padding: const EdgeInsets.symmetric(
                    horizontal: GeneralConst.paddingHorizontal) +
                const EdgeInsets.only(top: GeneralConst.paddingVertical),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: GeneralConst.appName,
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
                  url: Platform.isIOS
                      ? AppLnksConst.rateAppStore
                      : AppLnksConst.rateGooglePlay,
                ),
                LinkBtnWidget(
                  text: S.of(context).shareWithFriedns,
                  shareText:
                      '${S.of(context).boardBuddyIsYourUltimateBoardGameCompanion}\n\n$urlPreview',
                  url: AppLnksConst.webSitelink,
                  isShareButton: true,
                ),
                LinkBtnWidget(
                  text: S.of(context).projectWebsite,
                  url: AppLnksConst.webSitelink,
                ),
                LinkBtnWidget(
                  text: S.of(context).telegram,
                  url: AppLnksConst.telegramLink,
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).sinceThisIsAnOpenSourceProjectYouCanLeave,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                LinkBtnWidget(
                  text: S.of(context).githubRepository,
                  url: AppLnksConst.githubLink,
                ),
                const SizedBox(height: 10),
                const AddFavouriteGame(),
                const SizedBox(height: 10),
                LinkBtnWidget(
                  text: S.of(context).followMeOnXTwitter,
                  url: AppLnksConst.xLink,
                ),
                LinkBtnWidget(
                  text: S.of(context).checkMyWebsite,
                  url: AppLnksConst.myWebSitelink,
                ),
                const SizedBox(height: 10),
                Divider(
                  color: theme.borderColor,
                  thickness: 0.7,
                ),
                LinkBtnWidget(
                  text: S.of(context).takeALookAtMyKnightsGraphApp,
                  url: Platform.isIOS
                      ? AppLnksConst.kgAppStore
                      : AppLnksConst.kgGooglePlay,
                ),
                Divider(
                  color: theme.borderColor,
                  thickness: 0.7,
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).appreciation,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).toAllWhoCreatedThe,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const LinkBtnWidget(
                  text: GeneralConst.lucideIcons,
                  url: AppLnksConst.lucideIconsLink,
                ),
                const SizedBox(height: 15),
                Text(
                  S.of(context).toBoardBuddysContributors,
                  style:
                      theme.display2.copyWith(color: theme.secondaryTextColor),
                ),
                const ContributorsWidget(
                  contributors: ContributorsConst.contributors,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
