import 'package:http/http.dart';

import '../../data/http/http_client.dart';
import '../../infra/http/http_adapter.dart';

HttpClient makeHttpAdapter() => HttpAdapter(Client());
