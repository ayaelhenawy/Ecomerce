import 'package:flutter/material.dart';
import 'package:my_project/ThemeNotifier.dart';
import 'package:my_project/src/Login.dart';
import 'package:my_project/src/auth/onboarding/view/page/onboarding_page.dart';
import 'package:my_project/src/splash.dart';
import 'package:my_project/start.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeNotifier.themeMode,
          home: SplashScreen(),
        );
      },
    );
  }
}
