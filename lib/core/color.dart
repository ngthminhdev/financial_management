import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class AppColors {
  static final _instance = AppColors._internal();
  final bg = HexColor.fromHex('#fafbfd');
  final white = HexColor.fromHex('#ffffff');

  final purple = HexColor.fromHex('#864AF9');
  final darkPurple = HexColor.fromHex('#362f83');
  final mediumPurple = HexColor.fromHex('#AB81FB');
  final lightPurple = HexColor.fromHex('#F3EDFF');

  final yellow = HexColor.fromHex('#FFE9B1');
  final lime = HexColor.fromHex('#4BFACD');
  final orange = HexColor.fromHex('#fa7248');
  final darkBlue = HexColor.fromHex('#3B8486');

  final grey = HexColor.fromHex("#D2D1D9");
  final lightGrey = HexColor.fromHex("#ececef");
  final charcoal = HexColor.fromHex("#696471");

  final strongOrange = HexColor.fromHex("#fa554b");
  final green = HexColor.fromHex("#3fd6b1");
  final strongYellow = HexColor.fromHex('#f9da89');

  final lightPink = HexColor.fromHex('#f3edff');
  final darkCharcoal = HexColor.fromHex('#58535f');

  static Color randomColor() {
    final String hex = RandomColor.getColor(
        Options(format: Format.hex, luminosity: Luminosity.bright));
    final Color randomColor = HexColor.fromHex(hex);
    return randomColor;
  }

  factory AppColors() {
    return _instance;
  }
  AppColors._internal();
}

final appColors = AppColors();
