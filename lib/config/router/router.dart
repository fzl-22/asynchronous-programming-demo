import 'package:asynchronous_programming/src/models/user_model.dart';
import 'package:asynchronous_programming/src/pages/details_page.dart';
import 'package:asynchronous_programming/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: HomePage.path,
  routes: [
    GoRoute(
      name: HomePage.name,
      path: HomePage.path,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: DetailsPage.name,
      path: DetailsPage.path,
      pageBuilder: (context, state) {
        final user = state.extra as UserModel;

        return CustomTransitionPage(
          key: state.pageKey,
          child: DetailsPage(user: user,),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var curveTween = CurveTween(curve: curve);

            var offsetAnimation = Tween(begin: begin, end: end)
                .chain(curveTween)
                .animate(animation);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      },
    ),
  ],
);
