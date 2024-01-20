import 'package:asynchronous_programming/src/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: HomePage.path,
  routes: [
    GoRoute(
      name: HomePage.name,
      path: HomePage.path,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
