import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class GoogleAnalyticsTracker {
  // Singleton pattern to ensure a single instance of FirebaseAnalytics
  static final GoogleAnalyticsTracker _instance = GoogleAnalyticsTracker._internal();
  factory GoogleAnalyticsTracker() => _instance;

  // FirebaseAnalytics instance
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // FirebaseAnalyticsObserver instance to track navigation
  final FirebaseAnalyticsObserver observer;

  // Private constructor
  GoogleAnalyticsTracker._internal() : observer = FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);

  // Function to log a custom event
  Future<void> logCustomEvent({required String eventName, Map<String, Object>? parameters}) async {
    await _analytics.logEvent(
      name: eventName,
      parameters: parameters,
    );
  }

  // Function to set the current screen
  Future<void> setCurrentScreen({required String screenName,required String screenClassOverride}) async {
    await _analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClassOverride,
    );
  }

  // Function to log a user property
  Future<void> setUserProperty({required String name, required String value}) async {
    await _analytics.setUserProperty(
      name: name,
      value: value,
    );
  }

  // Function to log when the user signs in
  Future<void> logLogin({String loginMethod = 'email'}) async {
    await _analytics.logLogin(
      loginMethod: loginMethod,
    );
  }

  // Function to log when the user signs up
  Future<void> logSignUp({String signUpMethod = 'email'}) async {
    await _analytics.logSignUp(
      signUpMethod: signUpMethod,
    );
  }

  // Function to track a user making a purchase
  Future<void> logPurchase({required double amount, required String currency}) async {
    await _analytics.logEvent(
      name: 'purchase',
      parameters: {
        'value': amount,
        'currency': currency,
      },
    );
  }

  // Function to log when a user starts checkout
  Future<void> logBeginCheckout({required double amount, required String currency}) async {
    await _analytics.logEvent(
      name: 'begin_checkout',
      parameters: {
        'value': amount,
        'currency': currency,
      },
    );
  }

  // Function to log a search event
  Future<void> logSearch({required String searchTerm}) async {
    await _analytics.logSearch(
      searchTerm: searchTerm,
    );
  }
}
