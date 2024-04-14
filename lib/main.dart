import 'package:financial_management/pages/introduction/introduction_page.dart';
import 'package:financial_management/pages/login/login_page.dart';
import 'package:financial_management/pages/main/main_page.dart';
import 'package:financial_management/router/router.dart' as route;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:syncfusion_flutter_core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var isSaveLoggedIn = prefs.getBool('isSaveLoggedIn') ?? false;
  var isAppInit = prefs.getBool('isAppInit') ?? false;
  // SyncfusionLicense.registerLicense("Ngo9BigBOggjHTQxAR8/V1NAaF1cXmhNYVJ0WmFZfVpgdV9FZVZRTGY/P1ZhSXxXdkZiWn5dc3NXTmJVWEU=");
  runApp(MyApp(
    isAppInit: isAppInit,
    isSaveLoggedIn: isSaveLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isSaveLoggedIn;
  final bool isAppInit;
  MyApp({super.key, required this.isAppInit, required this.isSaveLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: 'SFPro',
        useMaterial3: true,
      ),
      onGenerateRoute: route.Router.generateRoute,
      home: Scaffold(
        body: isSaveLoggedIn
            ? MainPage()
            : isAppInit
                ? LoginPage()
                : IntroductionPage(),
      ),
    );
  }
}
