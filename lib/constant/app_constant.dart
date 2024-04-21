import 'package:financial_management/core/color.dart';
import 'package:financial_management/widgets/button/row_select.dart';
import 'package:financial_management/widgets/popups/app_popup.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:remixicon/remixicon.dart';

class AppConstant {
  static final AppConstant _instance = AppConstant._internal();
  // final String apiHost = '192.168.0.73:2002';
  // final String apiHost = '172.16.3.224:2002';
  final String apiHost = '54.179.222.129:2002';

  final String unknownError = "Lỗi không xác định";

  final Map<int, IconData> walletIconMap = {
    1: Ionicons.wallet,
    2: Remix.hand_coin_fill,
    3: Remix.funds_fill,
    4: Remix.more_fill,
  };

  final List<PopupItem> budgetSelects = [
    PopupItem(
        widget: RowSelectWidget(
          icon: Ionicons.wallet,
          title: "Mặc định",
          color: appColors.strongYellow,
        ),
        value: 1),
    PopupItem(
        widget: RowSelectWidget(
          icon: Remix.hand_coin_fill,
          title: "Tiết kiệm",
          color: appColors.mediumPurple,
        ),
        value: 2),
    PopupItem(
        widget: RowSelectWidget(
          icon: Remix.funds_fill,
          title: "Đầu tư",
          color: appColors.strongOrange,
        ),
        value: 3),
  ];

  final Map<int, IconData> categoryIconMap = {
    0: Remix.home_3_fill, // Nhà cửa
    1: Remix.restaurant_fill, // Đồ đi chợ nấu ăn
    2: Ionicons.fast_food, // Các bữa ăn uống bên ngoài
    3: Remix.drinks_2_fill, // Uống các thứ (cafe, trà sữa..)
    4: Remix.motorbike_fill, // Xe cộ, đi lại
    5: Remix.capsule_fill, // Đau ốm
    6: Remix.beer_fill, // Đám tiệc
    7: Remix.exchange_dollar_line, // Trả nợ - Trả góp các thứ
    8: Remix.shake_hands_fill, // Các mối quan hệ
    9: Remix.book_2_fill, // Học tập
    10: Remix.bank_fill, // Tiết kiệm
    11: Remix.smartphone_line, // Thiết bị - điện tử
    12: Remix.shopping_bag_4_fill, // Mua sắm
    13: Remix.tools_fill, // Tools
    14: Remix.funds_fill, // Đầu tư
    15: Remix.more_fill, // Khác
    16: Icons.pets, // Pet,
    17: Ionicons.ice_cream, // Di choi
    18: Remix.hearts_fill,
    19: Remix.refund_fill, // Luong
  };


  factory AppConstant() {
    return _instance;
  }
  AppConstant._internal();
}

final appConstant = AppConstant();
