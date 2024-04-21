import 'package:animations/animations.dart';
import 'package:financial_management/base/base_mixin_model.dart';
import 'package:financial_management/constant/common_constant.dart';
import 'package:financial_management/core/color.dart';
import 'package:financial_management/pages/login/login_page.dart';
import 'package:financial_management/pages/more/more_page_model.dart';
import 'package:financial_management/widgets/button/row_select.dart';
import 'package:financial_management/widgets/loading/line_sketch.dart';
import 'package:financial_management/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:remixicon/remixicon.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage>
    with MixinModel<MorePageModel>, SingleTickerProviderStateMixin {
  MorePageModel pageModel = MorePageModel();

  @override
  MorePageModel withModel() {
    return pageModel;
  }

  @override
  Widget build(BuildContext context) {
    return present(context);
  }

  @override
  Function(BuildContext context, MorePageModel model, Widget? child)
      withBuilder() {
    return (BuildContext context, MorePageModel model, Widget? child) {
      return ModalProgressHUD(
        inAsyncCall: pageModel.busy,
        progressIndicator: const LoadingWidget(),
        child: buildBody(context),
      );
    };
  }

  @override
  void initState() {
    pageModel.initData(context);
    super.initState();
  }

  Widget buildBody(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
            color: appColors.bg,
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            child: Column(children: [
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  child: pageModel.user == null
                      ? buildInformationSketch()
                      : buildInformation()),
              const SizedBox(
                height: 32,
              ),
              OpenContainer(
                transitionType: ContainerTransitionType.fade,
                transitionDuration: const Duration(milliseconds: 500),
                openBuilder: (context, _) => const LoginPage(),
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
                    child: const RowSelectWidget(
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
                transitionDuration: const Duration(milliseconds: 500),
                openBuilder: (context, _) => const LoginPage(),
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
                    child: const RowSelectWidget(
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
                transitionDuration: const Duration(milliseconds: 500),
                openBuilder: (context, _) => const LoginPage(),
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
                    child: const RowSelectWidget(
                      title: 'Nâng cấp Premium',
                      icon: Remix.key_2_fill,
                      // color: appColors.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                // onTap: openContainer,
                onTap: () {
                  pageModel.logout();
                },
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
                  child: const RowSelectWidget(
                    title: 'Đăng xuất',
                    icon: Remix.logout_box_fill,
                    // color: appColors.green,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              OpenContainer(
                transitionType: ContainerTransitionType.fade,
                transitionDuration: const Duration(milliseconds: 500),
                openBuilder: (context, _) => const LoginPage(),
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
                    child: const RowSelectWidget(
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

  Row buildInformationSketch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  appColors.grey,
                  appColors.lightGrey,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Container(
                width: 106,
                height: 106,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      appColors.grey,
                      appColors.lightGrey,
                    ],
                    end: Alignment.topLeft,
                    begin: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
        ]),
        const SizedBox(
          width: 8,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.only(top: 3),
                child: Icon(Remix.profile_line,
                    size: 22, color: appColors.darkPurple),
              ),
              const SizedBox(
                width: 5,
              ),
              LineSketch(160, 18)
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Ionicons.analytics_sharp,
                  size: 18, color: appColors.darkPurple),
              const SizedBox(
                width: 9,
              ),
              LineSketch(80, 18)
            ]),
            const SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Remix.lock_star_line, size: 18, color: appColors.charcoal),
              const SizedBox(
                width: 9,
              ),
              LineSketch(140, 18)
            ]),
          ],
        ),
      ],
    );
  }

  Row buildInformation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 53,
                    backgroundImage: AssetImage(
                      'assets/images/avatar.jpg',
                    ),
                  ),
                ),
                if (pageModel.user!.memberShipType == MEMBER_SHIP_PREMIUM)
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Lottie.asset('assets/animation/crown_bandage.json',
                          width: 45)),
              ],
            ),
          ),
        ]),
        const SizedBox(
          width: 8,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.only(top: 3),
                child: Icon(Remix.profile_line,
                    size: 22, color: appColors.darkPurple),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                pageModel.user!.username,
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: appColors.darkPurple),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Ionicons.analytics_sharp,
                  size: 18, color: appColors.darkPurple),
              const SizedBox(
                width: 9,
              ),
              Text(
                "7 ngày",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: appColors.purple),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Remix.lock_star_line, size: 18, color: appColors.charcoal),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Phiên bản",
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: appColors.charcoal),
              ),
              Text(
                pageModel.user!.memberShipType == MEMBER_SHIP_STANDARD
                    ? " Standard"
                    : " Premium",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: appColors.darkCharcoal),
              ),
            ]),
          ],
        ),
      ],
    );
  }
}
