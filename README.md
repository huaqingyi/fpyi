# fpyi

A new flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## flutter install
* pubspec.yaml
```
dev_dependencies:
  flutter_test:
    sdk: flutter

  fpyi: ^0.0.2
```

## Quick Start
* main.dart
```
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
```
* router.dart
```
import 'package:fpyi/fpyi.dart';
import 'package:fpyi_example/layout/layout.dart';
import 'package:fpyi_example/layout/router.dart';
import 'package:fpyi_example/login/login.dart';

List<PYIRoute> root = [
  PYIRoute(
    path: '/',
    component: Layout(),
    children: layout
  ),
  PYIRoute(
    path: '/login',
    component: Login(),
  )
];
```
* layout/layout.dart
```
import 'package:flutter/material.dart';
import 'package:fpyi/fpyi.dart';

class Layout extends PYIComponent {
  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout ...'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Layout Header ...'),
            Expanded(
              child: RouteView().display,
            ),
            Text('Layout Footer ...'),
          ],
        ),
      ),
    );
  }
}
```

### Thinks ...
* export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;
* sudo flutter packages pub publish -v
