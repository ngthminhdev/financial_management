import 'package:flutter/material.dart';
export 'src/model/menu_item.dart';
import 'src/model/menu_item.dart';
import 'src/nav_bar_body.dart';

class NavBar extends StatelessWidget {
  final List<BarItem> barItems;
  final int selectedIndex;
  final double iconSize;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? _activeColor;
  final Color? _inactiveColor;
  final OnButtonPressCallback onButtonPressed;
  final Color backgroundColor;
  NavBar({
    Key? key,
    required this.barItems,
    required this.selectedIndex,
    required this.onButtonPressed,
    required Color activeColor,
    Color? inactiveColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.iconSize = 30,
    this.backgroundColor = Colors.white,
  })  : assert(
          !barItems.any((BarItem element) =>
              (element.activeColor != null || element.inactiveColor != null)),
        ),
        _activeColor = activeColor,
        _inactiveColor = inactiveColor ?? activeColor.withOpacity(0.5),
        assert(barItems.length > 1),
        assert(barItems.length < 6),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarBody(
      buttons: barItems,
      iconSize: iconSize,
      activeColor: _activeColor,
      inactiveColor: _inactiveColor,
      backgroundColor: backgroundColor,
      onButtonPress: onButtonPressed,
      selectedIndex: selectedIndex,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
