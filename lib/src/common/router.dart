import 'package:demo_project/home_page_screen.dart';
import 'package:demo_project/name_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, __) => const HomePageScreen()),
    GoRoute(path: '/name', builder: (_, __) => const NameScreen()),
  ],
);
