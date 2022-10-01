import 'package:faker/faker.dart';

DateTime makeValidDate() {
  final DateTime validDate = faker.date.dateTime(minYear: 1996, maxYear: 2021);
  return validDate;
}

DateTime makeEarlyInvalidDate() {
  final DateTime invalidDate =
      faker.date.dateTime(minYear: 1000, maxYear: 1990);
  return invalidDate;
}

DateTime makeLateInvalidDate() {
  final DateTime invalidDate =
      faker.date.dateTime(minYear: 2100, maxYear: 3000);
  return invalidDate;
}

const validUrl =
    'https://api.nasa.gov/planetary/apod?api_key=vwEGRVVekBVT8GXSzPpBHdG3GeTJ0DwRdZDcXLec&start_date=2017-07-08&end_date=2017-07-12';
