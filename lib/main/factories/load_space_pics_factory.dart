import 'package:space_pics/main/factories/api_url_factory.dart';
import 'package:space_pics/data/usecases/remote_load_space_pics.dart';
import 'package:space_pics/main/factories/http_client_factory.dart';

RemoteLoadSpacePics makeRemoteLoadSpacePics(DateTime date) =>
    RemoteLoadSpacePics(
      url: ApiUrlFactory.createUrlFromDate(date),
      httpClient: makeHttpAdapter(),
    );
