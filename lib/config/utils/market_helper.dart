import 'package:board_buddy/config/constants/app_constants.dart';

/// Helper class to determine the current market based on the configuration
class MarketHelper {
  /// Returns true if the app is configured for RuStore
  static bool isRuStore() {
    return _getCurrentOtherAppsUrl().contains('rustore.ru');
  }

  /// Returns true if the app is configured for Google Play
  static bool isGooglePlay() {
    return _getCurrentOtherAppsUrl().contains('play.google.com');
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

  /// Helper method to get the current URL being used
  /// This should match what's being used in the app
  static String _getCurrentOtherAppsUrl() {
    // Check which URL is currently active
    // The Makefile will modify this to switch between markets
    return AppLnksConst.otherAppsRustoreLink; // This will be changed by make
  }
}

