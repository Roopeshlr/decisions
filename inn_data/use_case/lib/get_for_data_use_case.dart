import 'dart:async';

import 'package:core_usecase/base_use_case.dart';
import 'package:entities/dummy/dummy_form_data.dart';
import 'package:entities/order_repo.dart';

class GetFormDataUseCase extends BaseUseCase<List<DummyFormData>, String> {
  OrderRepo _orderRepo;

  GetFormDataUseCase(this._orderRepo);

  @override
  Future<List<DummyFormData>> execute([String url]) {
    print("Roope url is $url");
    return _orderRepo.getFormData(url);
  }
}
