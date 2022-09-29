import 'package:equatable/equatable.dart';

class SpacePicEntitity extends Equatable {
  final DateTime date;
  final String explanation;
  final String title;
  final String imgUrl;

  const SpacePicEntitity({
    required this.date,
    required this.explanation,
    required this.title,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [
        date,
        explanation,
        title,
        imgUrl,
      ];
}
