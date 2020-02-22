import 'package:fpyi/fpyi.dart';
import 'package:fpyi_example/pages/transport/carrier/carrier.dart';
import 'package:fpyi_example/pages/transport/order/order.dart';

List<PYIRoute> transport = [
  PYIRoute(
    path: '/',
    component: Carrier(),
  ),
  PYIRoute(
    path: '/carrier',
    component: Carrier(),
  ),
  PYIRoute(
    path: '/order',
    component: Order(),
  ),
];
