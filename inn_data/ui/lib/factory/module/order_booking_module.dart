import 'package:core_ui/base_view.dart';
import 'package:core_ui/base_view_out_state.dart';
import 'package:core_ui/base_view_state.dart';
import 'package:entities/order_repo.dart';
import 'package:ui/formpage/form_page_view.dart';
import 'package:ui/homepage/my_home_page_view.dart';
import 'package:use_case/get_data_dart_use_case.dart';
import 'package:use_case/get_for_data_use_case.dart';

class OrderBookingModule {
  OrderRepo _orderRepo;

  OrderBookingModule(this._orderRepo);

  BaseView<BaseViewState, BaseViewOutState> getData() {
    return MyHomePageView(GetDataUseCase(_orderRepo));
  }

  BaseView<BaseViewState, BaseViewOutState> getFormData() {
    return FormPageView(GetFormDataUseCase(_orderRepo));
  }
}
