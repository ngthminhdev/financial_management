import 'package:financial_management/helper/number_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoneyTextInputFormatter extends TextInputFormatter {
  static const _separator = ',';
  static const _maxDecimalDigits = 2;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }
    String newText = NumberHelper.formatMoney(double.tryParse(oldValue.text) ?? 0.0);

    // final int newTextLength = newValue.text.length;
    // int selectionIndex = newValue.selection.end;

    // final StringBuffer newText = StringBuffer();
    // int selectionCount = 0;

    // for (int i = 0; i < newTextLength; i++) {
    //   if (i > 0 && (newTextLength - i) % 3 == 0) {
    //     newText.write(_separator);
    //   }

    //   newText.write(newValue.text[i]);

    //   if (i < selectionIndex) {
    //     selectionCount++;
    //   }
    // }

    // selectionIndex += selectionCount > 0 ? (selectionCount ~/ 3) : 0;

    return TextEditingValue(
      text: newText,
      // selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}