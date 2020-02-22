import 'package:flutter/material.dart';
import 'package:fpyi/fpyi.dart';

class Login extends PYIComponent {
  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login ...'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('test ...'),
          onPressed: () async {
            print('test');
          },
        ),
      ),
    );
  }
}
