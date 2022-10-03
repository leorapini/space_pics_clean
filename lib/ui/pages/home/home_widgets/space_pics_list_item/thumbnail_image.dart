import 'package:flutter/material.dart';

import '../../../../shared_widgets/internet_image.dart';

class ThumbnailImage extends StatelessWidget {
  final String imgUrl;

  const ThumbnailImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: InternetImage(imgUrl: imgUrl),
    );
  }
}
