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
