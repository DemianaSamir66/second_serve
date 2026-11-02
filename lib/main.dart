import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:second_serve/core/routes/app_router.dart';
import 'package:second_serve/core/theme/app_theme.dart';

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
      child: const SecondServeApp(),
    ),
  );
}

class SecondServeApp extends StatelessWidget {
  const SecondServeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second Serve',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      initialRoute: AppRouter.splash,
      routes: AppRouter.routes,
    );
  }
}