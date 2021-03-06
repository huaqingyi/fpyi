import 'package:fpyi/fpyi.dart';
import 'package:fpyi_example/layout/layout.dart';
import 'package:fpyi_example/login/login.dart';
import 'package:fpyi_example/layout/router.dart';

List<PYIRoute> root = [
  PYIRoute(
    path: '/',
    component: Layout(),
    children: layout,
  ),
  PYIRoute(
    path: '/login',
    component: Login(),
  )
];
