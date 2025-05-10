import 'package:demo_project/src/common/initalizer.dart';
import 'package:demo_project/src/common/router.dart';
import 'package:demo_project/src/config/provider_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(providers: ProviderConfig.providers, child: const MyApp()),
  );
  await AppInitializer().initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Counter App',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
