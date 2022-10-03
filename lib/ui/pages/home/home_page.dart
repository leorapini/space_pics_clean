import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/bloc/home_bloc.dart';
import '../../../presentation/bloc/home_event.dart';
import '../../shared_widgets/add_vertical_space.dart';
import '../../shared_widgets/my_app_bar.dart';
import 'home_widgets/space_pics_list.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(LoadHomeEvent());
    return Scaffold(
      appBar: const MyAppBar(),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          AddVerticalSpace(30),
          SpacePicsList(),
        ],
      ),
    );
  }
}
