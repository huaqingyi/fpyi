import 'package:fpyi/fpyi.dart';
import 'package:fpyi_example/pages/home/home.dart';
import 'package:fpyi_example/pages/test/test.dart';

List<PYIRoute> layout = [
  PYIRoute(
    path: '/',
    component: Home(),
  ),
  PYIRoute(
    path: '/home',
    component: Home(),
  ),
  PYIRoute(
    path: '/test',
    component: Test(),
  ),
];
