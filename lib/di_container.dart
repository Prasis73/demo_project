import 'package:demo_project/src/provider/counter_provider.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => CounterProvider());
}
