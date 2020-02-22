import 'package:flutter/material.dart';
import 'package:fpyi/fpyi.dart';

class Home extends PYIComponent {
  @override
  Widget render(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('Home ...'),
          FlatButton(
            child: Text('go test ...'),
            onPressed: () {
              Navigator.of(context).pushNamed('/test');
            },
          ),
        ],
      ),
    );
  }
}
