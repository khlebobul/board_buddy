import 'package:board_buddy/config/constants/app_constants.dart';

/// Helper class to determine the current market based on the configuration
class MarketHelper {
  /// Returns true if the app is configured for RuStore
  static bool isRuStore() {
    return AppLnksConst.otherAppsGooglePlayLink.contains('rustore.ru');
  }

  /// Returns true if the app is configured for Google Play
  static bool isGooglePlay() {
    return AppLnksConst.otherAppsGooglePlayLink.contains('play.google.com');
  }

  /// Returns the current market name
  static String getCurrentMarket() {
    if (isRuStore()) {
      return 'RuStore';
    } else if (isGooglePlay()) {
      return 'Google Play';
    } else {
      return 'Unknown';
    }
  }

  /// Returns true if rating functionality should be shown
  /// (only for Google Play and App Store, not for RuStore)
  static bool shouldShowRating() {
    return !isRuStore();
  }
}
