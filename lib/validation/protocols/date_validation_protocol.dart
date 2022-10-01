import 'validation_error.dart';

abstract class DateValidation {
  ValidationError? validate(DateTime date);
}
