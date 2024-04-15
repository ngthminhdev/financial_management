import 'package:intl/intl.dart';

class NumberHelper {
  static String formatMoney(double money, {bool tail = true}) {
    final formatter = NumberFormat('#,###');
    if (!tail) {
      return formatter.format(money);
    }
    return '${formatter.format(money)}đ';
  }

  static double moneyConvert(String money) {
    String cleanedString = money.replaceAll(',', '');
    return double.parse(cleanedString);
  }
}
