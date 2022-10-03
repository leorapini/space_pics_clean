import 'package:flutter/material.dart';

class ErrorImageContainer extends StatelessWidget {
  const ErrorImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Icon(
          Icons.no_photography,
          size: 40,
          color: Colors.grey,
        ),
      ),
    );
  }
}
