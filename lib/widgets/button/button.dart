import 'package:financial_management/core/color.dart';
import 'package:financial_management/widgets/button/button_constant.dart';
import 'package:flutter/material.dart';

class FMButton extends StatelessWidget {
  final String text;
  final FMButtonType type;
  final FMButtonSize size;
  final Widget? icon;
  final VoidCallback? onPressed;
  const FMButton({
    Key? key,
    required this.text,
    this.type = FMButtonType.primary,
    this.size = FMButtonSize.medium,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  Color _getButtonBGColor(FMButtonType type) {
    switch (type) {
      case FMButtonType.primary:
        return appColors.purple;
      case FMButtonType.secondary:
        return appColors.mediumPurple;
      case FMButtonType.attention:
        return appColors.yellow;
      case FMButtonType.text:
        return Colors.transparent;
    }
  }

  Color _getButtonTextColor(FMButtonType type) {
    switch (type) {
      case FMButtonType.primary:
        return Colors.white;
      case FMButtonType.attention:
        return Colors.black;
      case FMButtonType.secondary:
        return Colors.white;
      case FMButtonType.text:
        return appColors.purple;
    }
  }

  EdgeInsets _getButtonPadding(FMButtonSize size) {
    switch (size) {
      case FMButtonSize.large:
        return const EdgeInsets.symmetric(vertical: 15, horizontal: 40);
      case FMButtonSize.medium:
        return const EdgeInsets.symmetric(vertical: 15, horizontal: 30);
      case FMButtonSize.small:
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 20);
      case FMButtonSize.max:
        return const EdgeInsets.symmetric(vertical: 15, horizontal: 0);
    }
  }

  double _getButtonWidth(FMButtonSize size) {
    switch (size) {
      case FMButtonSize.large:
        return 250;
      case FMButtonSize.medium:
        return 150;
      case FMButtonSize.small:
        return 100;
      case FMButtonSize.max:
        return double.infinity;
    }
  }

  double _getButtonHeight(FMButtonSize size) {
    switch (size) {
      case FMButtonSize.large:
        return 50;
      case FMButtonSize.medium:
        return 40;
      case FMButtonSize.small:
        return 30;
      case FMButtonSize.max:
        return 50;
    }
  }

  double _getButtonTextSize(FMButtonSize size) {
    switch (size) {
      case FMButtonSize.large:
        return 16;
      case FMButtonSize.medium:
        return 14;
      case FMButtonSize.small:
        return 12;
      case FMButtonSize.max:
        return 18;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _getButtonBGColor(type),
        ),
        constraints: BoxConstraints(
          minWidth: _getButtonWidth(size),
          minHeight: _getButtonHeight(size),
        ),
        padding: _getButtonPadding(size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: _getButtonTextSize(size),
                  color: _getButtonTextColor(type),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
