import 'package:intl/intl.dart';

import 'date_factory.dart';

class ApiUrlFactory {
  static const String _apiUrl = 'https://api.nasa.gov/planetary/apod';
  static const String _apiKey = 'vwEGRVVekBVT8GXSzPpBHdG3GeTJ0DwRdZDcXLec';

  static String createUrlFromDate(DateTime startDate) {
    final DateFactory date = DateFactory(startDate);
    final String dateX = _toApiStringFormat(date.current);
    final String xDaysAgoDate = _toApiStringFormat(date.xDaysAgo);
    final String url =
        '$_apiUrl?api_key=$_apiKey&start_date=$xDaysAgoDate&end_date=$dateX';
    return url;
  }

  // Returns a String with the following format YYYY-MM-DD as per Nasa's Api
  // Nasa API docs https://github.com/nasa/apod-api
  static String _toApiStringFormat(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(date);
    return formattedDate;
  }
}
