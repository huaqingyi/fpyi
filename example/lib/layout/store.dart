// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'store.g.dart';

class LayoutStore = _LayoutStore with _$LayoutStore;

abstract class _LayoutStore with Store {
  @observable
  int isLogin;

  @observable
  int value = 0;

  @observable
  int currentIndex = 0;

  @observable
  Route<dynamic> component;

  @observable
  BuildContext context;

  @action
  void increment() {
    value++;
  }

  _LayoutStore() {
    isLogin = 0;
  }

  @action
  Object checkLogin(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // prefs.remove('token');
    if (token == null) {
      Navigator.of(context).pushNamed('/login');
      isLogin = 0;
    } else {
      isLogin = 1;
    }
    return token;
  }

  // @action
  // Object checkLogin() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token');
  //   // prefs.remove('token');
  //   if (token == null) {
  //     isLogin = 0;
  //   } else {
  //     isLogin = 1;
  //   }
  //   return token;
  // }

  @action
  void initComponent(Route<dynamic> comp) {
    component = comp;
  }

  @action
  void initContext(BuildContext ctx) {
    context = ctx;
  }

  @action
  PopupMenuItem<String> createHeaderBtn(IconData icon, String text, String id) {
    return PopupMenuItem<String>(
      value: id,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(icon, color: Colors.blue),
          new Text(text),
        ],
      ),
    );
  }

  @action
  void onItemSelected(int index) {
    currentIndex = index;
    // print(Navigator.of(context));
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed('/finance');
        break;
      case 1:
        Navigator.of(context).pushNamed('/transport');
        break;
      case 2:
        Navigator.of(context).pushNamed('/goods');
        break;
      case 3:
        Navigator.of(context).pushNamed('/supplier');
        break;
      case 4:
        Navigator.of(context).pushNamed('/setting');
        break;
    }
  }
}
