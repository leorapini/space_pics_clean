import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di.dart' as locator;
import 'presentation/bloc/space_pics_list/space_pics_list_bloc.dart';
import 'ui/pages/home_page.dart';

void main() {
  locator.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator.locator<SpacePicsListBloc>()),
      ],
      child: MaterialApp(
        title: 'Space Pics',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
            body: Center(
          child: HomePage(),
        )),
      ),
    );
  }
}
