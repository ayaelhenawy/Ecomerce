import 'package:flutter/material.dart';
import 'package:my_project/src/Login.dart';
import 'package:my_project/src/auth/onboarding/view/page/onboarding_page.dart';
import 'package:my_project/src/dashbord/view/page/dashboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  MaterialApp materialApp = MaterialApp(home: const OnBoardingPage());

  runApp(materialApp);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(home: LoginScreen());
  }
}
