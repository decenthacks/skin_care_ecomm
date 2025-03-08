import 'package:intl/intl.dart';

class MyFormatter {
  /// **Format Date**
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); // ✅ Corrected month format
  }

  /// **Format Currency**
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  /// **Format Phone Number (US Format)**
  static String formatPhoneNumber(String phoneNumber) {
    // Remove non-digit characters
    String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length == 10) {
      return '(${digitsOnly.substring(0, 3)}) ${digitsOnly.substring(3, 6)}-${digitsOnly.substring(6)}';
    } else if (digitsOnly.length == 11) {
      return '+${digitsOnly.substring(0, 1)} (${digitsOnly.substring(1, 4)}) ${digitsOnly.substring(4, 7)}-${digitsOnly.substring(7)}';
    }

    return phoneNumber; // Return as is if format doesn't match
  }

  /// **Format International Phone Number**
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters
    String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length < 3) {
      return phoneNumber; // ✅ Avoid out-of-range errors
    }

    // Extract country code and remaining number
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    String formattedNumber = digitsOnly.substring(2);

    return '$countryCode $formattedNumber'; // ✅ Fixed missing return statement
  }
}
