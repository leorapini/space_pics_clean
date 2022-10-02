import 'package:flutter/material.dart';

class StateErrorWidget extends StatelessWidget {
  final String errorMessage;

  const StateErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('ERROR'),
          Text(errorMessage),
        ],
      ),
    );
  }
}
