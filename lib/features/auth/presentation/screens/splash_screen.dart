import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:second_serve/core/constants/app_assets.dart';
import 'package:second_serve/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  /// بيتنده بعد ما الأنيميشن والانتظار يخلصوا.
  final VoidCallback onFinished;
  final Duration duration;

  const SplashScreen({
    super.key,
    required this.onFinished,
    this.duration = const Duration(milliseconds: 3000),
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _scale;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _scale = Tween<double>(begin: 0.9, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.forward();

    _timer = Timer(widget.duration, () {
      if (mounted) widget.onFinished();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final size = MediaQuery.sizeOf(context);

    final blobColor = Theme.of(context).brightness == Brightness.dark
        ? colors.primaryLight
        : const Color(0xFFC5CBB0);

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          // بقعة فوق يمين
          Positioned(
            top: -size.width * 0.25,
            right: -size.width * 0.3,
            child: _Blob(size: size.width * 0.9, color: blobColor),
          ),
          // بقعة تحت شمال
          Positioned(
            bottom: -size.width * 0.3,
            left: -size.width * 0.3,
            child: _Blob(size: size.width * 0.9, color: blobColor),
          ),

          // اللوجو في النص
          Center(
            child: FadeTransition(
              opacity: _fade,
              child: ScaleTransition(
                scale: _scale,
                child: Image.asset(
                  AppAssets.logo,
                  width: size.width * 0.7,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.volunteer_activism,
                      size: 96,
                      color: colors.primary,
                    );
                  },
                ),
              ),
            ),
          ),

          // التاجلاين تحت
          Positioned(
            left: 24,
            right: 24,
            bottom: MediaQuery.paddingOf(context).bottom + size.height * 0.1,
            child: FadeTransition(
              opacity: _fade,
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: colors.primaryDark,
                  ),
                  children: const [
                    TextSpan(text: 'Rescue Food, '),
                    TextSpan(
                      text: 'Make a Difference',
                      style: TextStyle(color: Color(0xFFE8704A)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// دايرة ضبابية ناعمة بتتلاشى للشفاف.
class _Blob extends StatelessWidget {
  final double size;
  final Color color;

  const _Blob({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: 0.9),
              color.withValues(alpha: 0.0),
            ],
            stops: const [0.2, 1.0],
          ),
        ),
      ),
    );
  }
}