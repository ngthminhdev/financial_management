import 'package:financial_management/core/color.dart';
import 'package:financial_management/pages/analytics/analytics_page.dart';
import 'package:financial_management/pages/home/home_page.dart';
import 'package:financial_management/pages/more/more_page.dart';
import 'package:financial_management/pages/plan/plan_page.dart';
import 'package:financial_management/router/router.dart' as route;
import 'package:financial_management/widgets/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
// import 'package:syncfusion_flutter_core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SyncfusionLicense.registerLicense("Ngo9BigBOggjHTQxAR8/V1NAaF1cXmhNYVJ0WmFZfVpgdV9FZVZRTGY/P1ZhSXxXdkZiWn5dc3NXTmJVWEU="); 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageController _pageController;
  int selectedIndex = 0;

  List<Widget> _listOfPages = <Widget>[
    Container(alignment: Alignment.center, child: HomePage()),
    Container(alignment: Alignment.center, child: PlanPage()),
    Container(alignment: Alignment.center, child: SizedBox()),
    Container(alignment: Alignment.center, child: AnalyticsPage()),
    Container(alignment: Alignment.center, child: MorePage()),
  ];

  void _onNavbarChange(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
        /// body: RegisterPage(),
        body: Column(
          children: <Widget>[
            Expanded(child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfPages,
            ))
          ],
        ),
        bottomNavigationBar: _buildNavbar(),
      ),
    );
  }

  NavBar _buildNavbar() {
    return NavBar(
      backgroundColor: Colors.white,
      onButtonPressed: _onNavbarChange,
      iconSize: 30,
      fontSize: 14,
      activeColor: AppColors.purple,
      inactiveColor: AppColors.grey,
      selectedIndex: selectedIndex,
      barItems: <BarItem>[
        BarItem(
          icon: Symbols.home_filled,
          title: 'Tổng quan',
        ),
        BarItem(
          icon: Symbols.format_list_bulleted,
          title: 'Mục tiêu',
        ),
        BarItem(
          icon: Symbols.add_circle,
          title: '',
        ),
        BarItem(
          icon: Symbols.finance,
          title: 'Phân tích',
        ),
        BarItem(
          icon: Symbols.browse,
          title: 'Thêm...',
        ),
      ],
    );
  }
}
