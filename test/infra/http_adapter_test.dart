import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_pics/infra/http_adapter.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late HttpAdapter sut;
  late MockHttpClient mockHttpClient;
  late String url;

  setUp(() {
    mockHttpClient = MockHttpClient();
    sut = HttpAdapter(mockHttpClient);
    url = faker.internet.httpUrl();
  });
}