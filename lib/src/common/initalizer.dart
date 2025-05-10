import 'package:flutter/material.dart';
import 'package:demo_project/di_container.dart' as di;

class AppInitializer {
  Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await di.init();
  }
}
