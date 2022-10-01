import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_pics/data/http/http_client.dart';
import 'package:space_pics/data/http/http_error.dart';
import 'package:space_pics/data/usecases/remote_load_space_pics.dart';
import 'package:space_pics/domain/entities/space_pic_entity.dart';
import 'package:space_pics/domain/helpers/domain_error.dart';

import '../mocks/api_mock.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late RemoteLoadSpacePics sut;
  late MockHttpClient mockHttpClient;
  late String url;
  late List<Map<String, dynamic>> apiValidResultMock;
  late List<Map<String, dynamic>> apiInvalidResultMock;

  setUp(() {
    mockHttpClient = MockHttpClient();
    url = faker.internet.httpUrl();
    apiValidResultMock = ApiMock.makeResponseJsonList();
    apiInvalidResultMock = ApiMock.makeInvalidJsonList();
    sut = RemoteLoadSpacePics(url: url, httpClient: mockHttpClient);
  });

  test('should call HttpClient with correct url', () async {
    when(() => mockHttpClient.request(url: url))
        .thenAnswer((_) async => apiValidResultMock);

    await sut.load();

    verify(() => mockHttpClient.request(url: url));
  });

  test('should return list of space pics entity on 200', () async {
    when(() => mockHttpClient.request(url: url))
        .thenAnswer((_) async => apiValidResultMock);

    final result = await sut.load();

    expect(
      result,
      [
        SpacePicEntitity(
          date: DateTime.parse(apiValidResultMock[0]['date']),
          explanation: apiValidResultMock[0]['explanation'],
          title: apiValidResultMock[0]['title'],
          imgUrl: apiValidResultMock[0]['url'],
        ),
        SpacePicEntitity(
          date: DateTime.parse(apiValidResultMock[1]['date']),
          explanation: apiValidResultMock[1]['explanation'],
          title: apiValidResultMock[1]['title'],
          imgUrl: apiValidResultMock[1]['url'],
        )
      ],
    );
  });

  test('should throw UnexpectedError on 200 with invalid json data', () async {
    when(() => mockHttpClient.request(url: url))
        .thenAnswer((_) async => apiInvalidResultMock);

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });

  test('should throw UnexpectedError on 404', () async {
    when(() => mockHttpClient.request(url: url)).thenThrow(HttpError.notFound);

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });

  test('should throw UnexpectedError on 500', () async {
    when(() => mockHttpClient.request(url: url))
        .thenThrow(HttpError.serverError);

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });

  test('should throw AccessDeniedError on 403', () async {
    when(() => mockHttpClient.request(url: url)).thenThrow(HttpError.forbidden);

    final future = sut.load();

    expect(future, throwsA(DomainError.accessDenied));
  });
}
