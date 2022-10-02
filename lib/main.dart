import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di.dart' as injection;
import 'presentation/bloc/home_bloc.dart';
import 'ui/pages/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injection.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => injection.locator<HomeBloc>()),
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
