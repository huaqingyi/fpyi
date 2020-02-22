import 'package:fpyi_example/libs/service.dart';
import 'package:fpyi_example/pages/transport/order/impl/dao.dart';

class OrderService extends PYIService {
  freightQuery(FreightQueryRequest request) {
    return this.http.get('/freight/query', queryParameters: request.toJson());
  }
}
