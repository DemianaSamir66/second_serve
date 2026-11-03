import 'package:flutter/material.dart';

import 'package:second_serve/features/auth/presentation/screens/splash_screen.dart';
import 'package:second_serve/features/auth/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:second_serve/features/auth/presentation/screens/welcome_screen.dart';

class AppRouter {
  AppRouter._();

  static const splash = '/';
  static const welcome = '/welcome';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signup = '/signup';
  static const forgetPassword = '/forget-password';

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

  static const profile = '/profile';
  static const editProfile = '/profile/edit';
  static const settings = '/settings';
  static const notificationSettings = '/settings/notifications';
  static const security = '/settings/security';
  static const privacySettings = '/settings/privacy';
  static const helpSupport = '/help-support';
  static const reportProblem = '/report-problem';
  static const termsPolicies = '/terms-policies';

  static const charityMain = '/charity';
  static const donateFood = '/charity/donate-food';
  static const activeDonations = '/charity/active-donations';
  static const donationDetails = '/charity/donation-details';
  static const removeListing = '/charity/remove-listing';
  static const charityImpact = '/charity/impact';
  static const charityNotifications = '/charity/notifications';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(
      onFinished: () {
        Navigator.of(context).pushReplacementNamed(onboarding);
      },
    ),

    onboarding: (context) => const OnboardingScreen(),

    welcome: (context) => WelcomeScreen(
      onEmail: () {
        Navigator.of(context).pushNamed(login);
      },
    ),
  };
}