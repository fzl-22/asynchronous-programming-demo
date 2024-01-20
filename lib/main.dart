import 'package:asynchronous_programming/config/router/router.dart';
import 'package:asynchronous_programming/config/theme/theme.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: theme,
      routerConfig: router,
    );
  }
}
