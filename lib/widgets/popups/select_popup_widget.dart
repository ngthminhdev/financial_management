import 'package:financial_management/core/color.dart';
import 'package:financial_management/widgets/button/button.dart';
import 'package:financial_management/widgets/button/button_constant.dart';
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
                              separatorBuilder: (context, index) =>
                                  Divider(thickness: 1, color: appColors.grey),
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

  void textAreaPopup(BuildContext context,
      {required Function(String?) callback, Widget? title}) async {
    TextEditingController _controller = TextEditingController();
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
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.5 - 52,
                            ),
                            child: TextFormField(
                              controller: _controller,
                              textAlign: TextAlign.start,
                              minLines: 5,
                              maxLines: 10,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: appColors.lightGrey,
                                // suffixIcon: widget.isObscured ? Icon(Symbols.remove_red_eye) : null,
                                alignLabelWithHint: true,
                                isDense: true,
                                contentPadding: const EdgeInsets.all(10),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                label: Row(
                                  children: [
                                    Icon(
                                      Remix.edit_2_line,
                                      color: appColors.charcoal,
                                    ),
                                    Text(
                                      "Ghi chú...",
                                      style:
                                          TextStyle(color: appColors.charcoal),
                                    )
                                  ],
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: appColors
                                          .charcoal), // Màu border khi không focus
                                  borderRadius: BorderRadius.circular(
                                      8), // Đặt border radius
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: appColors
                                          .charcoal), // Màu border khi không focus
                                  borderRadius: BorderRadius.circular(
                                      8), // Đặt border radius
                                ),
                              ),
                              onChanged: (value) {
                                // _validator(value, widget.onChange);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FMButton(
                            text: "Lưu",
                            size: FMButtonSize.max,
                            onPressed: () {
                              final String note = _controller.text;
                              Navigator.of(context).pop(note);
                            },
                          )
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
