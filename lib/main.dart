import 'package:financial_management/core/color.dart';
import 'package:financial_management/pages/analytics/analytics_page.dart';
import 'package:financial_management/pages/budget/budget_page.dart';
import 'package:financial_management/pages/home/home_page.dart';
import 'package:financial_management/pages/more/more_page.dart';
import 'package:financial_management/pages/plan/plan_page.dart';
import 'package:financial_management/router/router.dart' as route;
import 'package:financial_management/widgets/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
// import 'package:syncfusion_flutter_core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SyncfusionLicense.registerLicense("Ngo9BigBOggjHTQxAR8/V1NAaF1cXmhNYVJ0WmFZfVpgdV9FZVZRTGY/P1ZhSXxXdkZiWn5dc3NXTmJVWEU=");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageController _pageController;
  int selectedIndex = 2;

  List<Widget> _listOfPages = <Widget>[
    Container(alignment: Alignment.center, child: HomePage()),
    Container(alignment: Alignment.center, child: PlanPage()),
    Container(alignment: Alignment.center, child: BudgetPage()),
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
      // supportedLocales: const [
      //   Locale('vi'),
      //   Locale('en'),
      // ],
      // localizationsDelegates: const [
      //   SfGlobalLocalizations.delegate,
      // ],
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
                child: PageView(
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
      activeColor: appColors.purple,
      inactiveColor: appColors.grey,
      selectedIndex: selectedIndex,
      barItems: <BarItem>[
        BarItem(
          icon: Remix.home_fill,
          title: 'Tổng quan',
        ),
        BarItem(
          icon: Remix.list_check_3,
          title: 'Mục tiêu',
        ),
        BarItem(
          icon: Remix.add_circle_fill,
          title: 'Ngân sách',
        ),
        BarItem(
          icon: Remix.line_chart_line,
          title: 'Phân tích',
        ),
        BarItem(
          icon: Remix.function_add_fill,
          title: 'Thêm...',
        ),
      ],
    );
  }
}
