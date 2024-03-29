import 'package:flutter/material.dart';

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
	static final bg = HexColor.fromHex('#fafbfd'); 

	static final purple = HexColor.fromHex('864AF9');
	static final mediumPurple = HexColor.fromHex('AB81FB');
	static final lightPurple = HexColor.fromHex('F3EDFF');

	static final yellow = HexColor.fromHex('FFE9B1'); 
	static final lime = HexColor.fromHex('4BFACD');
	static final orange = HexColor.fromHex('FA744B');
	static final darkBlue = HexColor.fromHex('3B8486');

	static final grey = HexColor.fromHex("#D2D1D9");
	static final charcoal = HexColor.fromHex("#6C6B70");

	static final strongOrange = HexColor.fromHex("#fa7248");
	static final green = HexColor.fromHex("#3fd6b1");
	static final strongYellow = HexColor.fromHex('f9da89'); 

}
