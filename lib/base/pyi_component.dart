import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class PYIComponent extends StatelessWidget {
  PYIComponent({Key key}) : super(key: key);

  dynamic componentWillMountBuild(
    BuildContext context,
    RouteSettings settings,
  ) {
    return this.componentWillMount(context, settings);
  }

  @protected
  dynamic componentWillMount(BuildContext context, RouteSettings settings) {
    return null;
  }

  @protected
  dynamic componentWillUpdate(BuildContext context) {
    return null;
  }

  @protected
  Widget render(BuildContext context);

  @override
  Widget build(BuildContext context) {
    this.componentWillUpdate(context);
    return this.render(context);
  }
}
