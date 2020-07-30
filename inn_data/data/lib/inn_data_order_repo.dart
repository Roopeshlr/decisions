import 'dart:async';
import 'package:entities/dummy/dummy_data.dart';
import 'package:entities/dummy/dummy_form_data.dart';
import 'package:entities/order_repo.dart';
import 'package:remote_api/remote_api_services.dart';

class InnDataOrderRepo extends OrderRepo {
  @override
  Future<List<DummyData>> getItems() async {
    return await RemoteApiServicesHomePageData("https://ds-ecom.azurewebsites.net/products").then((value){
      List<DummyData> result = value.map((e) => (DummyData(
       definitionUrl: e.definitionUrl,
        name: e.name,
      ))).toList() ;
      return Future.value(result);
    });
  }

  @override
  Future<List<DummyFormData>> getFormData(url) async {
    return await RemoteApiServicesFormData(url).then((value){
    List<DummyFormData> result = value.map((e) => (DummyFormData(
    validationMessage: e.validationMessage,
    mandatory: e.mandatory,
    defaultValue: e.defaultValue,
    caption: e.caption,
    type: e.type,
    ))).toList() ;
    return Future.value(result);
   });
  }
}
