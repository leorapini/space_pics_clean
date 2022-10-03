import 'package:flutter/material.dart';

import '../../../../helpers/from_datetime_to_string.dart';

class ThumbnailDescription extends StatelessWidget {
  final String title;
  final DateTime date;

  const ThumbnailDescription({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  static const TextStyle titleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 13.0, bottom: 7.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: titleStyle,
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: Text(fromDateTimeToString(date))),
      ],
    );
  }
}
