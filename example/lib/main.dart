import 'package:flutter/material.dart';
import 'package:fpyi/fpyi.dart';
import 'router.dart';

class App extends PYIComponent {
  final Fpyi fpyi;
  App({this.fpyi});

  @override
  Widget render(BuildContext context) {
    return MaterialApp(
      title: 'PYI Async Package',
      initialRoute: '/',
      onGenerateRoute: fpyi.getRoutes,
    );
  }
}

void main() {
  final fpyi = Fpyi(
    router: root,
  );
  fpyi.bootstrap(
    App(
      fpyi: fpyi,
    ),
  );
  // runApp(App());
}
