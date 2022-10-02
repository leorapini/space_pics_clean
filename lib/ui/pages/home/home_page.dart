import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/bloc/home_bloc.dart';
import '../../../presentation/bloc/home_event.dart';
import '../../widgets/add_vertical_space.dart';
import '../../widgets/my_app_bar.dart';
import 'widgets/space_pics_list.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(LoadHomeEvent());
    return Scaffold(
      appBar: const MyAppBar(),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AddVerticalSpace(30),
            SpacePicsList(),
          ],
        ),
      ),
    );
  }
}
