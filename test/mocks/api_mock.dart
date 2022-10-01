import 'package:faker/faker.dart';

class ApiMock {
  static List<Map<String, dynamic>> makeResponseJsonList() => [
        {
          "date": faker.date.dateTime().toIso8601String(),
          "explanation": faker.randomGenerator.string(800),
          "hdurl": faker.internet.httpUrl(),
          "media_type": faker.randomGenerator.string(10),
          "service_version": faker.randomGenerator.string(2),
          "title": faker.randomGenerator.string(50),
          "url": faker.internet.httpUrl()
        },
        {
          "date": faker.date.dateTime().toIso8601String(),
          "explanation": faker.randomGenerator.string(800),
          "hdurl": faker.internet.httpUrl(),
          "media_type": faker.randomGenerator.string(10),
          "service_version": faker.randomGenerator.string(2),
          "title": faker.randomGenerator.string(50),
          "url": faker.internet.httpUrl()
        }
      ];

  static List<Map<String, dynamic>> makeInvalidJsonList() => [
        {
          'random_key': 'random_value',
        }
      ];
}
