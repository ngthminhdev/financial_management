import 'package:financial_management/pages/introduction/introduction_page.dart';
import 'package:financial_management/pages/login/login_page.dart';
import 'package:financial_management/pages/register/register_page.dart';
import 'package:financial_management/pages/root/root_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // RootPageModel _pageModel = RootPageModel();

  @override
  void initState() {
    // TODO: implement initState
    // _pageModel.firstTimeInit(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RootPageModel pageModel = Provider.of<RootPageModel>(context);
    pageModel.appInit(context);

    return pageModel.isComebackApp ? LoginPage() : IntroductionPage();
  }
}