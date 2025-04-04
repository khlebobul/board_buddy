import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for handling app reviews
class ReviewService {
  static const String _timesCountKey = 'times_count';
  static const String _lastReviewRequestKey = 'last_review_request';
  static const int _minTimesCount =
      2; // Minimum times count to request a review
  static const int _daysBeforeNextRequest =
      120; // ~4 months before next request

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
    final InAppReview inAppReview = InAppReview.instance;

    if (await shouldRequestReview()) {
      if (await inAppReview.isAvailable()) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt(
            _lastReviewRequestKey, DateTime.now().millisecondsSinceEpoch);
        await inAppReview.requestReview();
      }
    }
  }
}
