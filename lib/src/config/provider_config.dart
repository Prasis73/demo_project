import 'package:demo_project/di_container.dart' as di;
import 'package:demo_project/src/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class ProviderConfig {
  static final CounterProvider counterProvider = di.sl<CounterProvider>();

  //* --------------------------- End --------------------------- *//

  static final List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<CounterProvider>(create: (_) => counterProvider),
  ];

  /// Dispose

  static void dispose() {
    counterProvider.dispose();
  }

  static final ProviderConfig _instance = ProviderConfig._internal();

  factory ProviderConfig() {
    return _instance;
  }

  ProviderConfig._internal();
}
