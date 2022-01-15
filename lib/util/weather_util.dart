import 'package:intl/intl.dart';

class Util {
  static String appId = "b1b15e88fa797225412429c1c50c122a1";

  static String getFormatDate(DateTime dateTime) {
    return DateFormat("EEE, MMM d, y").format(dateTime);
  }
}
