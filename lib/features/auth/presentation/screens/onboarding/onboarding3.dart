
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:second_serve/core/constants/app_assets.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/app_theme.dart';

// Temporary main for testing this screen independently
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
      home: const Onboarding3(),
    );
  }
}

class Onboarding3 extends StatelessWidget {
  final VoidCallback? onSkip;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  const Onboarding3({
    super.key,
    this.onSkip,
    this.onNext,
    this.onPrevious,
  });

  static const Color titleColor = Color(0xFF23262F);
  static const Color descriptionColor = Color(0xFF7D7979);
  static const Color green = Color(0xFF285A27);
  static const Color grey = Color(0xFF929292);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 11, 18, 45),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 42,
                    height: 31,
                    child: TextButton(
                      onPressed: onSkip,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'skip'.tr(),
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: green,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 7),

                SizedBox(
                  width: 362,
                  height: 455,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      AppAssets.onboarding3,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: colors.inputFill,
                          child: const Icon(
                            Icons.image_not_supported_outlined,
                            size: 45,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                SizedBox(
                  height: 18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(grey, 6),
                      const SizedBox(width: 9),
                      _buildDot(grey, 6),
                      const SizedBox(width: 9),
                      _buildDot(Colors.black, 9),
                    ],
                  ),
                ),

                const SizedBox(height: 9),

                Text(
                  'onboarding3_title'.tr(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 33.9,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    color: titleColor,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'onboarding3_description'.tr(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    height: 1.6,
                    color: descriptionColor,
                  ),
                ),

                const SizedBox(height: 14),

                Container(
                  width: 226,
                  height: 64,
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: onPrevious,
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: 1.5,
                        height: 24,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: onNext,
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDot(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
