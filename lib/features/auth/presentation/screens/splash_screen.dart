
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:second_serve/core/constants/app_assets.dart';
import 'package:second_serve/core/theme/app_colors.dart';
import 'package:second_serve/core/theme/text_styles.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinished;
  final Duration duration;

  const SplashScreen({
    super.key,
    required this.onFinished,
    this.duration = const Duration(seconds: 5),
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

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _scale = Tween<double>(
      begin: 0.9,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();

    _timer = Timer(widget.duration, () {
      if (mounted) {
        widget.onFinished();
      }
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

    final blobColor = colors.splashBlob;
    final splashAccent = colors.splashAccent;

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          PositionedDirectional(
            top: -size.width * 0.25,
            end: -size.width * 0.3,
            child: _Blob(
              size: size.width * 0.9,
              color: blobColor,
            ),
          ),

          PositionedDirectional(
            bottom: -size.width * 0.3,
            start: -size.width * 0.3,
            child: _Blob(
              size: size.width * 0.9,
              color: blobColor,
            ),
          ),

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

          Positioned(
            left: 24,
            right: 24,
            bottom: MediaQuery.paddingOf(context).bottom +
                size.height * 0.1,
            child: FadeTransition(
              opacity: _fade,
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: AppTextStyles.body(context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: colors.primaryDark,
                  ),
                  children: [
                    TextSpan(
                      text: 'splash_tagline_start'.tr(),
                    ),
                    TextSpan(
                      text: 'splash_tagline_highlight'.tr(),
                      style: TextStyle(
                        color: splashAccent,
                      ),
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

class _Blob extends StatelessWidget {
  final double size;
  final Color color;

  const _Blob({
    required this.size,
    required this.color,
  });

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
