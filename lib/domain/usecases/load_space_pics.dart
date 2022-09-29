import '../entities/space_pic_entity.dart';

abstract class LoadSpacePics {
  Future<List<SpacePicEntitity>> load();
}
