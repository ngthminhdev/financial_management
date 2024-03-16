import 'package:intl/intl.dart';

class NumberHelper {
  static String formatMoney(double money) {
    final formatter = NumberFormat('#,###');
    return '${formatter.format(money)}đ';
  }
}
