
import 'package:flutter/material.dart';
import 'package:second_serve/core/routes/app_router.dart';

import 'onboarding1.dart';
import 'onboarding2.dart';
import 'onboarding3.dart';

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
      _finishOnboarding();
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
    _finishOnboarding();
  }

  void _finishOnboarding() {
    Navigator.of(context).pushReplacementNamed(
      AppRouter.welcome,
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
            onNext: _finishOnboarding,
            onPrevious: _previousPage,
          ),
        ],
      ),
    );
  }
}
