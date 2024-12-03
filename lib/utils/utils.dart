import 'package:intl/intl.dart';

class Utils {


  String currencyFormatter(double amount, {int? decimals}){
    return NumberFormat.currency(
      locale: 'en_US',
      decimalDigits: decimals ?? 2,
    ).format(amount).replaceAll('USD', '');
  }
}