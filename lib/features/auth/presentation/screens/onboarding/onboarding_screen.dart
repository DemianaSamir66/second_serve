import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:second_serve/core/theme/app_theme.dart';

import 'onboarding1.dart';
import 'onboarding2.dart';
import 'onboarding3.dart';
import '../welcome_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const OnboardingTestApp(),
    ),
  );
}

class OnboardingTestApp extends StatelessWidget {
  const OnboardingTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding(); // لو في الصفحة الأخيرة وداس Next هينقلنا للـ Welcome
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skipOnboarding() {
    // لو داس Skip ممكن نخليه ينقل للـ Welcome فوراً أو يروح لآخر صفحة
    _finishOnboarding();
  }

  void _finishOnboarding() {
    // الانتقال لصفحة الـ WelcomeScreen وحذف شاشات الـ Onboarding من الذاكرة
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(
          // هنا ممكن تربط الزراير بتاعت الـ Welcome لو حابب
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          Onboarding1(
            onSkip: _skipOnboarding,
            onNext: _nextPage,
          ),
          Onboarding2(
            onSkip: _skipOnboarding,
            onNext: _nextPage,
            onPrevious: _previousPage,
          ),
          Onboarding3(
            onSkip: _skipOnboarding,
            onNext: _finishOnboarding, // ربط زر التالي في الشاشة الأخيرة لينقلنا للـ Welcome
            onPrevious: _previousPage,
          ),
        ],
      ),
    );
  }
}