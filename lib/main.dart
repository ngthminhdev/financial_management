import 'package:flutter/material.dart';
import 'package:financial_management/pages/register/register_page.dart';
import 'package:financial_management/router/router.dart' as route;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'SFPro',
        useMaterial3: true,
      ),
      onGenerateRoute: route.Router.generateRoute,
      home: RegisterPage(),
    );
  }
}
