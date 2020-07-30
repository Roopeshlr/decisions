import 'dart:async';
import 'package:entities/dummy/dummy_data.dart';
import 'package:entities/dummy/dummy_form_data.dart';

abstract class OrderRepo{
  FutureOr<List<DummyData>> getItems();
  FutureOr<List<DummyFormData>> getFormData(String url);
}