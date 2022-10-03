import 'package:intl/intl.dart';

String fromDateTimeToString(DateTime date) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final String formattedDate = formatter.format(date);
  return formattedDate;
}