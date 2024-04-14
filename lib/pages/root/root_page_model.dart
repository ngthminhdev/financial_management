import 'package:financial_management/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class RootPageModel {
  bool isComebackApp = false;

  Future<void> appInit(BuildContext context) async {
    // setLoading(true);
    bool? isFirstTime = await LocalStorageService().getBool('FirstTimeInit');
    if (isFirstTime == null || isFirstTime == false) {
      await LocalStorageService().setBool('FirstTimeInit', true);
    }
    isComebackApp = isFirstTime ?? false;
  }
}
