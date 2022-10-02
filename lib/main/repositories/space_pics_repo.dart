import 'package:space_pics/data/usecases/remote_load_space_pics.dart';
import 'package:space_pics/domain/entities/space_pic_entity.dart';
import 'package:space_pics/domain/helpers/domain_error.dart';
import 'package:space_pics/domain/usecases/load_space_pics.dart';

class SpacePicsRepo implements LoadSpacePics {
  final RemoteLoadSpacePics remote;

  SpacePicsRepo({required this.remote});

  Future<List<SpacePicEntitity>> load() async {
    try {
      final spacePics = await remote.load();
      return spacePics;
    } catch (e) {
      if (e == DomainError.accessDenied) {
        rethrow;
      } else {
        throw DomainError.unexpected;
      }
    }
  }
}
