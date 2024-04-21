import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Center(
            child: Stack(
          children: [
            LoadingAnimationWidget.discreteCircle(
                size: 60,
                color: appColors.purple,
                secondRingColor: appColors.mediumPurple,
                thirdRingColor: appColors.lightPurple),
            Positioned(
                child: Lottie.asset('assets/animation/d_coin.json', width: 60, )),
          ],
        )),
      ),
    );
  }
}
