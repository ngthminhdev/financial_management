import 'package:financial_management/widgets/popups/select_popup_widget.dart';
import 'package:flutter/material.dart';

class BasePageModel {
  BuildContext context;
  void Function(void Function()) setState;
  BasePageModel(this.context, this.setState);

  bool _busy = false;
  bool _isForceLogin = false;
  bool _invalidVersion = false;

  bool get busy => _busy;
  bool get isForceLogin => _isForceLogin;
  bool get invalidVersion => _invalidVersion;

  setBusy(GlobalKey<NavigatorState> dialogKey, bool value,[ BuildContext? buildContext]) async {
    _busy = value;
    appPopup.loading(context, dialogKey: dialogKey, busy: value);
  }
}
