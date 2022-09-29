import '../http/http_error.dart';

DateTime fromStringToDate(String dateString) {
  try {
    final DateTime date = DateTime.parse(dateString);
    return date;
  } catch (e) {
    throw HttpError.invalidData;
  }
}
