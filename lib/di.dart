import 'package:get_it/get_it.dart';

import 'data/usecases/remote_load_space_pics.dart';
import 'infra/http_adapter.dart';
import 'presentation/bloc/home_bloc.dart';

final locator = GetIt.instance;

void init() {
  // BLOC
  locator.registerFactory(() => HomeBloc());

  // DataSource
  locator.registerLazySingleton(() => RemoteLoadSpacePics(
        url: locator(),
        httpClient: locator(),
      ));

  // Http
  locator.registerLazySingleton(() => HttpAdapter(locator()));
}
