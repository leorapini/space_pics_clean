import 'package:space_pics/main/factories/constants.dart';

class DateFactory {
  DateTime _currentDate;

  DateFactory(this._currentDate);

  DateTime get current => _currentDate;
  DateTime get xDaysAgo =>
      _currentDate.subtract(const Duration(days: numberOfDaysPerRequest));
  set newCurrentDate(DateTime newDate) {
    _currentDate = newDate.subtract(const Duration(days: 1));
  }
}
