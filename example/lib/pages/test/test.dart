import 'package:flutter/material.dart';
import 'package:fpyi/fpyi.dart';

class Test extends PYIComponent {
  Test() {
    print(1);
  }
  @override
  Widget render(BuildContext context) {
    print(2);
    return Center(
      child: Column(
        children: <Widget>[
          Text('Test ...'),
          FlatButton(
            child: Text('go home ...'),
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
          FlatButton(
            child: Text('go login ...'),
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
