import 'package:flutter/material.dart';
import 'package:fpyi/fpyi.dart';
import 'package:fpyi_example/libs/service.dart';
import 'package:fpyi_example/router.dart';

class App extends PYIComponent {
  final Fpyi fpyi;
  App({this.fpyi});

  @override
  void componentWillUpdate(BuildContext context) {
    PYIService.$context = context;
  }

  @override
  Widget render(BuildContext context) {
    return MaterialApp(
      title: '云链天下',
      theme: ThemeData(primaryColor: Colors.blue),
      initialRoute: '/',
      onGenerateRoute: fpyi.getRoutes,
    );
  }
}

void main() {
  final fpyi = Fpyi(
    router: root,
  );
  fpyi.bootstrap(App(fpyi: fpyi));
}
