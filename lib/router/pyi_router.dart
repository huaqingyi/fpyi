import 'package:flutter/material.dart';
import 'package:fpyi/fpyi.dart';

class PYIRouter {
  static PYIRouter _router;
  static PYIRouter register() {
    if (PYIRouter._router != null) {
      return PYIRouter._router;
    } else {
      return PYIRouter._router = PYIRouter();
    }
  }

  static PYIRouter i() {
    return PYIRouter.register();
  }

  Fpyi router;

  String active;

  PYIComponent component;

  List<PYIRoute> children;
}

class RouteViewComponent extends PYIComponent {
  final Widget component;
  RouteViewComponent({this.component});

  @override
  Widget render(BuildContext context) {
    return component;
  }
}

class RouteView {
  get display {
    PYIRouter prouter = PYIRouter.i();
    if (prouter.children != null) {
      String path = PYIRouter.i().active;
      PYIRoute route = prouter.children.firstWhere((route) {
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
      } else {
        PYIRouter.i().children = null;
      }
      return RouteViewComponent(
        component: route.component,
      );
    }
    return RouteViewComponent(
      component: Text('Not Found ...'),
    );
  }
}
