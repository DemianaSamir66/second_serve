
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  // ---------- Auth ----------
  static const splash = '/';
  static const welcome = '/welcome';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signup = '/signup';
  static const forgetPassword = '/forget-password';

  // ---------- User ----------
  static const userMain = '/user';
  static const aiSearchFilter = '/user/ai-search-filter';
  static const foodDetails = '/user/food-details';
  static const impact = '/user/impact';
  static const cart = '/user/cart';
  static const review = '/user/review';
  static const paymentMethods = '/user/payment-methods';
  static const addCard = '/user/add-card';
  static const notifications = '/user/notifications';
  static const aboutUs = '/user/about-us';
  static const contactUs = '/user/contact-us';

  // ---------- Shared ----------
  static const profile = '/profile';
  static const editProfile = '/profile/edit';
  static const settings = '/settings';
  static const notificationSettings = '/settings/notifications';
  static const security = '/settings/security';
  static const privacySettings = '/settings/privacy';
  static const helpSupport = '/help-support';
  static const reportProblem = '/report-problem';
  static const termsPolicies = '/terms-policies';

  // ---------- Charity ----------
  static const charityMain = '/charity';
  static const donateFood = '/charity/donate-food';
  static const activeDonations = '/charity/active-donations';
  static const donationDetails = '/charity/donation-details';
  static const removeListing = '/charity/remove-listing';
  static const charityImpact = '/charity/impact';
  static const charityNotifications = '/charity/notifications';

  // ---------- Routes ----------
  // كل شاشة هنضيفها هنا بعد ما نجهزها
  static final Map<String, WidgetBuilder> routes = {
    // Example:
    // splash: (context) => const SplashScreen(),
  };
}
