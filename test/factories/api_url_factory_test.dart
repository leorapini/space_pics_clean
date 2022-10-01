import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:space_pics/domain/helpers/domain_error.dart';
import 'package:space_pics/main/factories/api_url_factory.dart';
import 'package:space_pics/main/factories/constants.dart';

import 'mocks/api_url_mock.dart';

// class MockApiUrlFactory extends Mock implements ApiUrlFactory {}

void main() {
  late DateTime validDate;
  late DateTime randomValidDate;
  late DateTime randomEarlyInvalidDate;
  late DateTime randomLateInvalidDate;

  setUp(() {
    validDate = DateTime(2017, 7, 12); // '2017-07-08';
    randomValidDate = makeValidDate();
    randomEarlyInvalidDate = makeEarlyInvalidDate();
    randomLateInvalidDate = makeEarlyInvalidDate();
  });

  test('should generate correct url based on valid date', () {
    final result = ApiUrlFactory.createUrlFromDate(validDate);

    expect(result, validUrl);
  });

  test('should generate correct url based on random valid date', () {
    final result = ApiUrlFactory.createUrlFromDate(randomValidDate);
    final DateFormat formatter = DateFormat(apiDateFormat);
    final String randomValidDateString = formatter.format(randomValidDate);

    expect(result.substring(116), randomValidDateString);
  });

  test('should throw UnexpectedError if date is earlier than 1995-06-16', () {
    expect(() => ApiUrlFactory.createUrlFromDate(randomEarlyInvalidDate),
        throwsA(DomainError.unexpected));
  });

  test('should throw UnexpectedError if date in the future', () {
    expect(() => ApiUrlFactory.createUrlFromDate(randomLateInvalidDate),
        throwsA(DomainError.unexpected));
  });
}
