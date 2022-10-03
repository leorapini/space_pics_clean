import '../constants/constants.dart';

class DateFactory {
  final DateTime _currentDate;

  DateFactory(this._currentDate);

  DateTime get current => _currentDate;
  DateTime get xDaysAgo =>
      _currentDate.subtract(const Duration(days: numberOfDaysPerRequest));
  DateTime get minusOneDay => _currentDate.subtract(const Duration(days: 1));
}
