import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpyi/base/pyi_component.dart';
import 'package:fpyi/router/pyi_route.dart';
import 'package:fpyi/router/pyi_router.dart';

export 'base/pyi_component.dart';
export 'router/pyi_route.dart';
export 'router/pyi_router.dart';

class Fpyi {
  static const MethodChannel _channel = const MethodChannel('fpyi');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  List<PYIRoute> router;
  RouteSettings settings;
  Fpyi({this.router});

  void bootstrap(PYIComponent app) {
    PYIRouter.register();
    PYIRouter.i().router = this;
    runApp(app);
  }

  MaterialPageRoute getRoutes(RouteSettings settings) {
    this.settings = settings;
    // print(this.router);
    // print(settings.name);

    String path = settings.name;
    PYIRouter.i().active = path;

    this.router = this.sortRoutes(this.router);

    PYIRoute route = this.router.firstWhere((route) {
      if (path.indexOf(route.path) == 0) {
        path = path.replaceFirst(route.path, '/').replaceAll('//', '/');
        return true;
      } else {
        return false;
      }
    });

    PYIRouter.i().component = route.component;
    PYIRouter.i().active = path;

    if (route.children != null) {
      PYIRouter.i().children = route.children;
    }

    WidgetBuilder builder = (BuildContext context) {
      PYIRouter.i().context = context;
      PYIRouter.i().settings = settings;
      route.component.componentWillMountBuild(context, settings);
      return route.component;
    };
    return MaterialPageRoute(builder: builder, settings: settings);
  }

  List<PYIRoute> sortRoutes(List<PYIRoute> routers) {
    routers.sort((PYIRoute a, PYIRoute b) => b.path.length - a.path.length);
    routers.forEach((route) {
      if (route.children != null) {
        return this.sortRoutes(route.children);
      } else {
        return route;
      }
    });
    return routers;
  }
}
