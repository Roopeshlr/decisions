

import 'package:core_ui/base_view.dart';
import 'package:ui/factory/module/inn_data_module.dart';
import 'package:ui/formpage/form_page_view.dart';
import 'package:ui/homepage/my_home_page_view.dart';


class ViewFactory {
  final _app = InnDataModule();

  static final ViewFactory _instance = ViewFactory._();

  initialise() async {
    return await _app.initialise();
  }

  factory ViewFactory() {
    return _instance;
  }

  ViewFactory._();

  final Map<Type, BaseView> _viewMap = Map();

  T get<T>() {
    if (_viewMap.containsKey(T)) {
      return _viewMap[T] as T;
    } else {
      BaseView view = _get<T>();
      _viewMap[T] = view;
//      _viewMap.putIfAbsent(T,()=> view);
      return view as T;
    }
  }

  BaseView _get<T>() {
    switch (T) {
      case MyHomePageView:
        return _app.orderBookingModule().getData();

      case FormPageView:
        return _app.orderBookingModule().getFormData();
      default:
        return throw Exception("View is not created for $T");
    }
  }

  void clearSession() {
    _viewMap.removeWhere((key, value) {
      switch (key) {
        default:
          return true;
      }
    });
  }
}
