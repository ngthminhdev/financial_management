import 'package:financial_management/core/color.dart';
import 'package:financial_management/helper/navigator_helper.dart';
import 'package:financial_management/pages/introduction/introduction_page_model.dart';
import 'package:financial_management/router/router_config.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatefulWidget {
  IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final IntroductionPageModel _pageModel = IntroductionPageModel();
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  void initState() {
    super.initState();
    _pageModel.appInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Image.asset(
                'assets/images/logo_image.png',
                height: 400,
              ),
              Text(
                "Chào mừng bạn đến với MManagement",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: appColors.darkPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Việc theo dõi chi tiêu và quản lý ngân sách cá nhân trở nên dễ dàng và hiệu quả. Hãy để chúng tôi giúp bạn kiểm soát tài chính và đạt được mục tiêu tiết kiệm của mình.",
                style: TextStyle(color: appColors.darkCharcoal, fontSize: 20),
              )
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Image.asset(
                'assets/images/plane.png',
                height: 400,
              ),
              Text(
                "Tạo Mục Tiêu Tiết Kiệm",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: appColors.darkPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Giúp bạn xác định và theo dõi tiến trình hướng tới các mục tiêu tài chính cá nhân, từ việc mua sắm nhỏ đến những dự định lớn như mua nhà hay du lịch.",
                style: TextStyle(
                    color: appColors.darkCharcoal,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Image.asset(
                'assets/images/wallet.png',
                height: 400,
              ),
              Text(
                "Báo Cáo Tài Chính",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: appColors.darkPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Cung cấp cái nhìn sâu sắc và toàn diện về tình hình tài chính của bạn. Từ biểu đồ thu nhập và chi phí đến phân tích xu hướng tiêu dùng, chúng tôi giúp bạn hiểu rõ từng đồng tiền của mình",
                style: TextStyle(
                    color: appColors.darkCharcoal,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Image.asset(
                'assets/images/plant.png',
                height: 400,
              ),
              Text(
                "Thu Gặt Thành Tựu",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: appColors.darkPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Không chỉ giúp bạn theo dõi tiến trình tài chính mà còn giúp bạn nhận ra và ăn mừng mỗi bước tiến nhỏ. Mỗi mục tiêu đạt được là một cột mốc quan trọng trên hành trình tài chính của bạn.",
                style: TextStyle(
                    color: appColors.darkCharcoal,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ],
      skip: Text(
        "Bỏ qua",
        style: TextStyle(color: appColors.purple),
      ),
      done: Text(
        "Hoàn tất",
        style: TextStyle(color: appColors.purple),
      ),
      next: Text(
        "Tiếp",
        style: TextStyle(color: appColors.purple),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: appColors.grey,
        activeColor: appColors.purple,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      showSkipButton: true,
      onDone: () {
        navigatorHelper.changeView(context, RouteNames.register,
            isReplaceName: true);
      },
    );
  }
}
