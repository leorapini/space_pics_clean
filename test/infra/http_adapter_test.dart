import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_pics/data/http/http_error.dart';
import 'package:space_pics/infra/http/http_adapter.dart';

class MockClient extends Mock implements Client {}

void main() {
  late HttpAdapter sut;
  late MockClient mockClient;
  late String url;
  late String body;

  setUp(() {
    mockClient = MockClient();
    sut = HttpAdapter(mockClient);
    url = faker.internet.httpUrl();
    body = jsonEncode({'any_key': 'any_value'});
  });

  test('should call Client with correct url', () async {
    when(() => mockClient.get(Uri.parse(url)))
        .thenAnswer((_) async => Response(body, 200));

    await sut.request(url: url);

    verify(() => mockClient.get(Uri.parse(url)));
  });

  test('should return data on 200', () async {
    when(() => mockClient.get(Uri.parse(url)))
        .thenAnswer((_) async => Response(body, 200));

    final response = await sut.request(url: url);

    expect(response, {'any_key': 'any_value'});
  });

  test('should throw BadRequestError on 400', () async {
    when(() => mockClient.get(Uri.parse(url)))
        .thenAnswer((_) async => Response('', 400));

    final future = sut.request(url: url);

    expect(future, throwsA(HttpError.badRequest));
  });

  test('should throw UnauthorizedError on 401', () async {
    when(() => mockClient.get(Uri.parse(url)))
        .thenAnswer((_) async => Response('', 401));

    final future = sut.request(url: url);

    expect(future, throwsA(HttpError.unauthorized));
  });

  test('should throw ForbiddenError on 403', () async {
    when(() => mockClient.get(Uri.parse(url)))
        .thenAnswer((_) async => Response('', 403));

    final future = sut.request(url: url);

    expect(future, throwsA(HttpError.forbidden));
  });

  test('should throw NotFoundError on 404', () async {
    when(() => mockClient.get(Uri.parse(url)))
        .thenAnswer((_) async => Response('', 404));

    final future = sut.request(url: url);

    expect(future, throwsA(HttpError.notFound));
  });

  test('should throw ServerError on 500', () async {
    when(() => mockClient.get(Uri.parse(url)))
        .thenAnswer((_) async => Response('', 500));

    final future = sut.request(url: url);

    expect(future, throwsA(HttpError.serverError));
  });
}
