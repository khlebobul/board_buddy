import 'package:rate_my_app/rate_my_app.dart';

/// Service for handling app reviews
class ReviewService {
  static const String _timesCountKey = 'times_count';
  static const String _lastReviewRequestKey = 'last_review_request';
  static const int _minTimesCount =
      2; // Minimum times count to request a review
  static const int _daysBeforeNextRequest =
      120; // ~4 months before next request

  /// Play application id and App Store id from the existing store links.
  static final RateMyApp _rateMyApp = RateMyApp.customConditions(
    googlePlayIdentifier: 'com.khlebobul.board_buddy',
    appStoreIdentifier: '6743980638',
    conditions: const <Condition>[],
  );

  static Future<void> incrementTimesCount() async {
    final prefs = await SharedPreferences.getInstance();
    int currentCount = prefs.getInt(_timesCountKey) ?? 0;
    await prefs.setInt(_timesCountKey, currentCount + 1);
  }

  static Future<bool> shouldRequestReview() async {
    final prefs = await SharedPreferences.getInstance();
    int timesCount = prefs.getInt(_timesCountKey) ?? 0;
    int? lastRequest = prefs.getInt(_lastReviewRequestKey);

    if (timesCount < _minTimesCount) {
      return false;
    }

    if (lastRequest != null) {
      final lastRequestDate = DateTime.fromMillisecondsSinceEpoch(lastRequest);
      final daysSinceLastRequest =
          DateTime.now().difference(lastRequestDate).inDays;
      if (daysSinceLastRequest < _daysBeforeNextRequest) {
        return false;
      }
    }

    return true;
  }

  static Future<void> requestReview() async {
    if (await shouldRequestReview()) {
      if (await _rateMyApp.isNativeReviewDialogSupported ?? false) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt(
            _lastReviewRequestKey, DateTime.now().millisecondsSinceEpoch);
        await _rateMyApp.launchNativeReviewDialog();
      }
    }
  }
}
