import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import 'error_image_container.dart';

class InternetImage extends StatelessWidget {
  const InternetImage({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? ImageNetwork(
            image: imgUrl,
            height: 400,
            width: 600,
            fitWeb: BoxFitWeb.cover,
          )
        : CachedNetworkImage(
            imageUrl: imgUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 55),
              child: Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress)),
            ),
            errorWidget: (context, url, error) => const ErrorImageContainer(),
            fit: BoxFit.cover,
          );
  }
}
