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
/*
      DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
*/
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
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   bool onBording = sharedPreferences.getBool('onboarding') ?? false;
//
//   MaterialApp materialApp = MaterialApp(
//     // home: onBording ? const LoginScreen() : const OnBoardingPage(),
//     useInheritedMediaQuery: true,
//     builder: DevicePreview.appBuilder,
//     onGenerateRoute: MyRoute.onNavigateByName,
//     onGenerateInitialRoutes: (_) => MyRoute.initialRoutes,
//   );
//   runApp(
//     DevicePreview(
//     enabled: false,
//     builder: (context) => materialApp,
//   ),);
// }

// class MyRoutes {
//   static List<Route> initRoutes = [
//     MaterialPageRoute<dynamic>(
//         builder: (BuildContext context) => const OnBoardingPage()),
//     MaterialPageRoute<dynamic>(
//         builder: (BuildContext context) => const SignUp()),
//     MaterialPageRoute<dynamic>(
//         builder: (BuildContext context) => const DashboardPage()),
//    ];
//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case 'login':
//         final List data = settings.arguments as List;
//         return MaterialPageRoute<dynamic>(
//             builder: (BuildContext context) => const DashboardPage());
//       case 'register':
//         return MaterialPageRoute<dynamic>(
//             builder: (BuildContext context) => const SignUp());
//       default:
//         return MaterialPageRoute<dynamic>(
//             builder: (BuildContext context) => const OnBoardingPage());
//     }
//   }
// }

// class MyApp extends StatelessWidget{
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider<DashboardControllerCubit>(create: (_) => DashboardControllerCubit()),
//         // Add other providers here
//       ],
//       child: DashboardPage(),
//
//     );
//   }
//   }