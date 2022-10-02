import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_pics/presentation/bloc/space_pics_list/space_pics_list_event.dart';

import '../../presentation/bloc/space_pics_list/space_pics_list_bloc.dart';
import '../../presentation/bloc/space_pics_list/space_pics_list_state.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SpacePicsListBloc>().add(LoadSpacePicsListEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            BlocBuilder<SpacePicsListBloc, SpacePicsListState>(
                builder: ((context, state) {
              if (state is SpacePicsListLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SpacePicsListLoadedState) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      itemCount: state.spacePicsData.length,
                      itemBuilder: ((context, i) {
                        if (state.spacePicsData.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(state.spacePicsData[0].title),
                          );
                        } else {
                          return const Text('Empty');
                        }
                      })),
                );
              } else if (state is SpacePicsListErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const SizedBox();
              }
            })),
          ],
        ),
      ),
    );
  }
}
