import 'package:data/inn_data_order_repo.dart';
import 'package:entities/order_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:mock_data/mock_order_repo.dart';
import 'package:ui/factory/module/order_booking_module.dart';

class InnDataModule {
  static bool enableOnScreenCrash = kReleaseMode ? false : true;
  static InnDataModule _instance;
  OrderRepo _orderRepoInstance;

  factory InnDataModule() {
    if (_instance == null) {
      _instance = InnDataModule._default();
    }
    return _instance;
  }

  InnDataModule._default();

  bool enableMock = false;

  Map<String, dynamic> _deviceConfig;

  OrderBookingModule _orderBookingModule;

  Future<bool> initialise() async {
    return true;
  }

  OrderBookingModule orderBookingModule() {
    if (_orderBookingModule == null) {
      _orderBookingModule = OrderBookingModule(_orderRepo());
    }
    return _orderBookingModule;
  }

  OrderRepo _orderRepo() {
    if (_orderRepoInstance == null) {
      if (!enableMock) {
        _orderRepoInstance = InnDataOrderRepo();

      } else {
        _orderRepoInstance = MockOrderRepo();
      }
    }
    return _orderRepoInstance;
  }
}
