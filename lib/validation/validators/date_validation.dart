import '../../main/factories/constants.dart';
import '../protocols/date_validation_protocol.dart';
import '../protocols/validation_error.dart';

class MinAndMaxDateValidation implements DateValidation {
  @override
  ValidationError? validate(DateTime date) {
    final DateTime now = DateTime.now();
    if (date.compareTo(now) > 0 || date.compareTo(earliestDatePossible) < 0) {
      return ValidationError.invalidDate;
    }
    return null;
  }
}
