import 'dart:async';

import 'package:financial_management/core/color.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class CategoryIconSketch extends StatefulWidget {
  double width = 100;
  double height = 10;
  CategoryIconSketch(this.width, this.height, {super.key});

  @override
  State<CategoryIconSketch> createState() => _CategoryIconSketchState();
}

class _CategoryIconSketchState extends State<CategoryIconSketch> {
  List<Color> colors = [appColors.grey, appColors.lightGrey];
  late Timer _timer;
  bool active = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        active = !active;
        if (active) {
          colors = [appColors.lightGrey, appColors.grey];
        } else {
          colors = [appColors.grey, appColors.lightGrey];
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      curve: Curves.fastOutSlowIn,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Icon(
          Remix.loader_2_fill,
          size: 24,
          color: appColors.darkCharcoal,
          fill: 1,
        ),
      ),
    );
  }
}
