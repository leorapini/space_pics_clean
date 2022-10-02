import 'package:intl/intl.dart';

import '../../domain/helpers/domain_error.dart';
import '../../validation/validators/date_validation.dart';
import 'constants.dart';
import 'date_factory.dart';

class ApiUrlFactory {
  static const String _apiUrl = 'https://api.nasa.gov/planetary/apod';
  static const String _apiKey = 'vwEGRVVekBVT8GXSzPpBHdG3GeTJ0DwRdZDcXLec';

  static String createUrlFromDate(DateTime endDate) {
    final validator = MinAndMaxDateValidation();
    if (validator.validate(endDate) != null) {
      throw DomainError.unexpected;
    }
    final DateFactory date = DateFactory(endDate);
    final String dateX = _toApiStringFormat(date.current);
    final String xDaysAgoDate = _toApiStringFormat(date.xDaysAgo);
    final String url =
        '$_apiUrl?api_key=$_apiKey&start_date=$xDaysAgoDate&end_date=$dateX';
    return url;
  }

  static String _toApiStringFormat(DateTime date) {
    final DateFormat formatter = DateFormat(apiDateFormat);
    final String formattedDate = formatter.format(date);
    return formattedDate;
  }
}
