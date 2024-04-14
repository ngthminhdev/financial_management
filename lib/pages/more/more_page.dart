import 'package:animations/animations.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/date_helper.dart';
import 'package:financial_management/pages/login/login_page.dart';
import 'package:financial_management/widgets/button/row_select.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:remixicon/remixicon.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
            color: appColors.bg,
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            child: Column(
                // mainAxisSize: MainAxisSize.max,
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Thông tin thêm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: appColors.darkPurple),
                    ),
                  ]),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    // padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 200,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(
                              0.2), // Màu và độ trong suốt của shadow
                          spreadRadius: 2, // Độ lan rộng của shadow
                          blurRadius: 5, // Độ mờ của shadow
                          offset: const Offset(
                              0, 3), // Độ dịch chuyển của shadow (x, y)
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      appColors.darkPurple,
                                      appColors.lightPurple,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage: AssetImage(
                                      'assets/images/avatar.jpg',
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Icon(Remix.profile_line,
                                        size: 22, color: appColors.darkPurple),
                                  ),
                                  Text(
                                    " Nguyễn Thanh Minh",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: appColors.darkPurple),
                                  ),
                                ]),
                            
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Ionicons.analytics_sharp,
                                      size: 18, color: appColors.darkPurple),
                                  // Text(
                                  //   "  Chuỗi: ",
                                  //   style: TextStyle(
                                  //       // fontWeight: FontWeight.bold,
                                  //       fontSize: 18,
                                  //       color: appColors.darkCharcoal),
                                  // ),
                                  Text(
                                    "   7 ngày",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: appColors.purple),
                                  ),
                                ]),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Remix.lock_star_line,
                                      size: 18, color: appColors.charcoal),
                                  // Text(
                                  //   "  Chuỗi: ",
                                  //   style: TextStyle(
                                  //       // fontWeight: FontWeight.bold,
                                  //       fontSize: 18,
                                  //       color: appColors.darkCharcoal),
                                  // ),
                                  Text(
                                    "   Phiên bản",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: appColors.charcoal),
                                  ),
                                  Text(
                                    " Standard",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: appColors.darkCharcoal),
                                  ),
                                ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: Duration(milliseconds: 500),
                    openBuilder: (context, _) => LoginPage(),
                    closedBuilder: (context, VoidCallback openContainer) =>
                        GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      // onTap: openContainer,
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.2), // Màu và độ trong suốt của shadow
                              spreadRadius: 2, // Độ lan rộng của shadow
                              blurRadius: 5, // Độ mờ của shadow
                              offset: const Offset(
                                  0, 3), // Độ dịch chuyển của shadow (x, y)
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: RowSelectWidget(
                          title: 'Chỉnh sửa thông tin',
                          icon: Remix.edit_2_fill,
                          // color: appColors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: Duration(milliseconds: 500),
                    openBuilder: (context, _) => LoginPage(),
                    closedBuilder: (context, VoidCallback openContainer) =>
                        GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      // onTap: openContainer,
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.2), // Màu và độ trong suốt của shadow
                              spreadRadius: 2, // Độ lan rộng của shadow
                              blurRadius: 5, // Độ mờ của shadow
                              offset: const Offset(
                                  0, 3), // Độ dịch chuyển của shadow (x, y)
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: RowSelectWidget(
                          title: 'Cài đặt',
                          icon: Remix.settings_3_fill,
                          // color: appColors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: Duration(milliseconds: 500),
                    openBuilder: (context, _) => LoginPage(),
                    closedBuilder: (context, VoidCallback openContainer) =>
                        GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      // onTap: openContainer,
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.2), // Màu và độ trong suốt của shadow
                              spreadRadius: 2, // Độ lan rộng của shadow
                              blurRadius: 5, // Độ mờ của shadow
                              offset: const Offset(
                                  0, 3), // Độ dịch chuyển của shadow (x, y)
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: RowSelectWidget(
                          title: 'Nâng cấp lên phiên bản Premium',
                          icon: Remix.key_2_fill,
                          // color: appColors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: Duration(milliseconds: 500),
                    openBuilder: (context, _) => LoginPage(),
                    closedBuilder: (context, VoidCallback openContainer) =>
                        GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      // onTap: openContainer,
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.2), // Màu và độ trong suốt của shadow
                              spreadRadius: 2, // Độ lan rộng của shadow
                              blurRadius: 5, // Độ mờ của shadow
                              offset: const Offset(
                                  0, 3), // Độ dịch chuyển của shadow (x, y)
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: RowSelectWidget(
                          title: 'Đăng xuất',
                          icon: Remix.logout_box_fill,
                          // color: appColors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: Duration(milliseconds: 500),
                    openBuilder: (context, _) => LoginPage(),
                    closedBuilder: (context, VoidCallback openContainer) =>
                        GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      // onTap: openContainer,
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.2), // Màu và độ trong suốt của shadow
                              spreadRadius: 2, // Độ lan rộng của shadow
                              blurRadius: 5, // Độ mờ của shadow
                              offset: const Offset(
                                  0, 3), // Độ dịch chuyển của shadow (x, y)
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: RowSelectWidget(
                          title: 'Ủng hộ tác giả',
                          icon: Remix.hand_coin_fill,
                          // color: appColors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ])),
      ),
    ));
  }
}
