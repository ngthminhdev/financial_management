import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class PopupItem {
  Widget widget;
  dynamic value;

  PopupItem({
    required this.widget,
    required this.value,
  });
}

class Popup {
  static final _instance = Popup._internal();

  void selectPopup(BuildContext context,
      {required Function(dynamic) callback,
      Widget? title,
      List<PopupItem> items = const []}) async {
    dynamic value = await showGeneralDialog(
      context: context,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) {
        return StatefulBuilder(builder: (context, setState) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                      maxHeight: MediaQuery.of(context).size.height * 0.5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(children: [
                      Positioned(
                        top: -5,
                        right: -5,
                          child: IconButton(
                        icon: const Icon(Remix.close_line),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (title != null) title,
                          Container(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.5 - 52,
                            ),
                            child: SingleChildScrollView(
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  final Widget widget = items[index].widget;
                                  final dynamic value = items[index].value;
                                  return GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      print(value);
                                      Navigator.of(context).pop(value);
                                    },
                                    child: widget,
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(
                                    thickness: 1, color: appColors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]))),
          );
        });
      },
    );
    callback(value);
  }

  factory Popup() {
    return _instance;
  }
  Popup._internal();
}

final appPopup = Popup();
