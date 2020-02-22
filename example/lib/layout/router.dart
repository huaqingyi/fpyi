import 'package:fpyi/fpyi.dart';
import 'package:fpyi_example/pages/finance/finance.dart';
import 'package:fpyi_example/pages/goods/goods.dart';
import 'package:fpyi_example/pages/setting/setting.dart';
import 'package:fpyi_example/pages/supplier/supplier.dart';
import 'package:fpyi_example/pages/transport/router.dart';
import 'package:fpyi_example/pages/transport/transport.dart';

List<PYIRoute> layout = [
  PYIRoute(
    path: '/',
    component: Finance(),
  ),
  PYIRoute(
    path: '/finance',
    component: Finance(),
  ),
  PYIRoute(
    path: '/goods',
    component: Goods(),
  ),
  PYIRoute(
    path: '/setting',
    component: Setting(),
  ),
  PYIRoute(
    path: '/supplier',
    component: Supplier(),
  ),
  PYIRoute(
    path: '/transport',
    component: Transport(),
    children: transport,
  ),
];
