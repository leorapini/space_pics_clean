import 'package:equatable/equatable.dart';

class SpacePicEntitity extends Equatable {
  final DateTime date;
  final String explanation;
  final String title;
  final String imgUrl;
  final String author;

  const SpacePicEntitity({
    required this.date,
    required this.explanation,
    required this.title,
    required this.imgUrl,
    required this.author,
  });

  @override
  List<Object?> get props => [
        date,
        explanation,
        title,
        imgUrl,
        author,
      ];
}
