import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/navigator_helper.dart';
import 'package:financial_management/router/router_config.dart';
import 'package:financial_management/widgets/button/button.dart';
import 'package:financial_management/widgets/button/button_constant.dart';
import 'package:financial_management/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PopupItem {
  Widget widget;
  dynamic value;

  PopupItem({
    required this.widget,
    required this.value,
  });
}

enum PopupType { success, error, warning }

class Popup {
  static final _instance = Popup._internal();

  void selectPopup(BuildContext context,
      {required Function(dynamic) callback,
      Widget? title,
      List<PopupItem> items = const []}) async {
    dynamic value = await showGeneralDialog(
      context: context,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (context, animation, secondaryAnimation) {
        return StatefulBuilder(builder: (context, setState) {
          return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: animation.value,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(10),
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.8,
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.5,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (title != null) title,
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: title != null ? 15 : 0),
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                                  0.5 -
                                              52,
                                    ),
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: items.length,
                                      itemBuilder: (context, index) {
                                        final Widget widget =
                                            items[index].widget;
                                        final dynamic value =
                                            items[index].value;
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
                                          Divider(
                                              thickness: 1,
                                              color: appColors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ]))),
                  ),
                );
              });
        });
      },
    );
    callback(value);
  }

  void textAreaPopup(BuildContext context,
      {required Function(String?) callback, Widget? title, String initialValue = ''}) async {
    TextEditingController controller = TextEditingController();
    controller.text = initialValue;
    dynamic value = await showGeneralDialog(
      context: context,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (context, animation, secondaryAnimation) {
        return StatefulBuilder(builder: (context, setState) {
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.scale(
                scale: animation.value,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (title != null) title,
                                if (title != null)
                                  const SizedBox(
                                    height: 15,
                                  ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                                0.5 -
                                            52,
                                  ),
                                  child: TextFormField(
                                    controller: controller,
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
                                            style: TextStyle(
                                                color: appColors.charcoal),
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
                                    final String note = controller.text;
                                    Navigator.of(context).pop(note);
                                  },
                                )
                              ],
                            ),
                          ]))),
                ),
              );
            },
          );
        });
      },
    );
    callback(value);
  }

  void dateTimePickerPopup(BuildContext context,
      {required Function(dynamic) callback, Widget? title}) async {
    dynamic value = await showGeneralDialog(
      context: context,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (context, animation, secondaryAnimation) {
        return StatefulBuilder(builder: (context, setState) {
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.scale(
                scale: animation.value,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          constraints: BoxConstraints(
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (title != null) title,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: title != null ? 15 : 0),
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                                0.5 -
                                            52,
                                  ),
                                  child: SfDateRangePicker(
                                    todayHighlightColor: appColors.purple,
                                    selectionColor: appColors.lightPurple,
                                    onSelectionChanged:
                                        (DateRangePickerSelectionChangedArgs
                                            args) {
                                      if (args.value != null) {
                                        DateTime selectedDate =
                                            args.value as DateTime;
                                        // DateTime now = DateTime.now();
                                        // // Tạo một DateTime mới với cùng ngày, nhưng sử dụng thời gian hiện tại
                                        // DateTime newDateTime = selectedDate.add(
                                        //     Duration(
                                        //         hours: now.hour,
                                        //         minutes: now.minute,
                                        //         seconds: now.second));

                                        Navigator.of(context).pop(selectedDate);
                                      } else {
                                        Navigator.of(context).pop(null);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ]))),
                ),
              );
            },
          );
        });
      },
    );
    callback(value);
  }

  void messagePopup(BuildContext context,
      {String? message, PopupType? type, Function()? callback}) async {
    PopupType pType = type ?? PopupType.success;
    Color borderColor = appColors.green;
    switch (pType) {
      case PopupType.success:
        borderColor = appColors.green;
        break;
      case PopupType.error:
        borderColor = appColors.red;
        break;
      case PopupType.warning:
        borderColor = appColors.orange;
        break;
    }

    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (context, animation, secondaryAnimation) {
        return StatefulBuilder(builder: (context, setState) {
          return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: animation.value,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(
                        child: Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.6,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                        maxHeight: MediaQuery.of(context).size.height * 0.4,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: borderColor,
                            style: BorderStyle.solid,
                            width: 2,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Thông báo',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: appColors.darkCharcoal,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: appColors.grey,
                          ),
                          message != null
                              ? Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: Text(
                                    message,
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: appColors.charcoal,
                                    ),
                                  ),
                                )
                              : Container(),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 80,
                              right: 80,
                            ),
                            child: FMButton(
                              text: 'Đóng',
                              size: FMButtonSize.small,
                              type: FMButtonType.secondary,
                              onPressed: () {
                                Navigator.of(context).pop();
                                // callback!();
                              },
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                );
              });
        });
      },
    );
    if (message == 'Phiên đăng nhập hết hạn') {
      return navigatorHelper.changeView(context, RouteNames.login,
          isReplaceName: true);
    }
    if (callback != null) {
      callback();
    }
  }

  void loading(BuildContext context,
      {required bool busy,
      required GlobalKey<NavigatorState> dialogKey}) async {
    if (busy) {
      await showGeneralDialog(
        context: dialogKey.currentContext ?? context,
        barrierColor: Colors.black45,
        // transitionDuration: const Duration(milliseconds: 150),
        pageBuilder: (context, animation, secondaryAnimation) {
          return StatefulBuilder(builder: (context, setState) {
            return const LoadingWidget();
          });
        },
      );
    } else {
      dialogKey.currentState?.pop();
      Navigator.of(dialogKey.currentContext ?? context).pop();
    }
  }

  factory Popup() {
    return _instance;
  }
  Popup._internal();
}


final appPopup = Popup();
