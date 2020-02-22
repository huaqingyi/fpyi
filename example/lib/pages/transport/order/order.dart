import 'package:flutter/material.dart';
import 'package:fpyi/fpyi.dart';

class Order extends PYIComponent {
  @override
  Widget render(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text('to Carrier'),
            onPressed: () {
              Navigator.of(context).pushNamed('/transport/carrier');
            },
          ),
        ],
      ),
    );
  }
}
