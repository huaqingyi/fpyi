import 'package:mobx/mobx.dart';
import 'package:fpyi_example/pages/transport/order/impl/dao.dart';
import 'package:fpyi_example/pages/transport/order/service.dart';

import 'impl/dto.dart';

part 'store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore with Store {
  @observable
  FreightQueryResponse freightQueryResponse;

  @observable
  OrderService service;

  _OrderStore() {
    this.service = OrderService();
  }

  Future<FreightQueryResponse> freightQuery(FreightQueryRequest request) async {
    this.freightQueryResponse = this.service.freightQuery(request);
    return this.freightQueryResponse;
  }
}
