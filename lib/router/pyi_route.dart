import 'package:fpyi/base/pyi_component.dart';

class PYIRoute {
  final String path;
  final PYIComponent component;
  List<PYIRoute> children;
  PYIRoute({
    this.path,
    this.component,
    this.children,
  });
}
