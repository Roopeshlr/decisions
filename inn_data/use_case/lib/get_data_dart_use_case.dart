import 'dart:async';

import 'package:core_usecase/base_use_case.dart';
import 'package:entities/dummy/dummy_data.dart';
import 'package:entities/order_repo.dart';

class GetDataUseCase extends BaseUseCase<List<DummyData>, Object> {
  OrderRepo _orderRepo;

  GetDataUseCase(this._orderRepo);

  @override
  Future<List<DummyData>> execute([Object param]) {
    return _orderRepo.getItems();
  }
}
