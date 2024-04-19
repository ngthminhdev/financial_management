import 'package:financial_management/core/color.dart';
import 'package:financial_management/pages/analytics/analytics_page.dart';
import 'package:financial_management/pages/budget/budget_page.dart';
import 'package:financial_management/pages/home/home_page.dart';
import 'package:financial_management/pages/more/more_page.dart';
import 'package:financial_management/pages/plan/plan_page.dart';
import 'package:financial_management/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  int selectedIndex = 3;

  final List<Widget> _listOfPages = <Widget>[
    Container(alignment: Alignment.center, child: const HomePage()),
    Container(alignment: Alignment.center, child: const PlanPage()),
    Container(alignment: Alignment.center, child: const BudgetPage()),
    Container(alignment: Alignment.center, child: const AnalyticsPage()),
    Container(alignment: Alignment.center, child: const MorePage()),
  ];

  void _onNavbarChange(int index) {
    setState(() {
      selectedIndex = index;
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
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
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _listOfPages,
      ),
      bottomNavigationBar: _buildNavbar(),
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
          icon: Remix.home_3_fill,
          title: 'Tổng quan',
        ),
        BarItem(
          icon: Remix.equalizer_fill,
          title: 'Mục tiêu',
        ),
        BarItem(
          icon: Remix.money_dollar_circle_fill,
          title: 'Ngân sách',
        ),
        BarItem(
          icon: Remix.pie_chart_2_fill,
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
