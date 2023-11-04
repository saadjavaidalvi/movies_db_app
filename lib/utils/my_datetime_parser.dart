import 'package:intl/intl.dart';

class MyDateFormat {
  String parseToString(String string,
      {required String parseFrom, required String parseTo}) {
    String stringDate =
        DateFormat(parseTo).format(DateFormat(parseFrom).parse(string));
    return stringDate;
  }
}
