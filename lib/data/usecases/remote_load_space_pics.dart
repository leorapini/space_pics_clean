import '../../domain/entities/space_pic_entity.dart';
import '../../domain/helpers/domain_error.dart';
import '../../domain/usecases/load_space_pics.dart';
import '../http/http_client.dart';
import '../http/http_error.dart';
import '../models/remote_space_pic_model.dart';

class RemoteLoadSpacePics implements LoadSpacePics {
  final String url;
  final HttpClient httpClient;

  RemoteLoadSpacePics({
    required this.url,
    required this.httpClient,
  });

  @override
  Future<List<SpacePicEntitity>> load() async {
    try {
      final httpRes = await httpClient.request(url: url);
      return httpRes
          .map<SpacePicEntitity>(
              (json) => RemoteSpacePicModel.fromJson(json).toEntity())
          .toList();
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}
