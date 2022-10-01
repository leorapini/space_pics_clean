import '../../domain/entities/space_pic_entity.dart';
import '../http/http_error.dart';

class RemoteSpacePicModel {
  final String? copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  RemoteSpacePicModel({
    this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  factory RemoteSpacePicModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['explanation', 'title', 'url'])) {
      throw HttpError.invalidData;
    }
    return RemoteSpacePicModel(
        date: json['date'],
        explanation: json['explanation'],
        hdurl: json['hdurl'],
        mediaType: json['media_type'],
        serviceVersion: json['service_version'],
        title: json['title'],
        url: json['url']);
  }

  SpacePicEntitity toEntity() => SpacePicEntitity(
        date: DateTime.parse(date),
        explanation: explanation,
        title: title,
        imgUrl: url,
      );
}
