import 'package:flutter/material.dart';

class BasePageModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  setBusy(bool value) async {
    _busy = value;
    notifyListeners();
  }
}
