import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionPageModel{
  // Function(dynamic)? setState;
  // IntroductionPageModel(this.setState);

  Future<void> appInit(BuildContext context) async {
    // setLoading(true);
    SharedPreferences localInstance = await SharedPreferences.getInstance();
    bool? isFirstTime = localInstance.getBool('isAppInit');
    if (isFirstTime == null || isFirstTime == false) {
      await localInstance.setBool('isAppInit', true);
    }
    // setState!((){});
  }
}
