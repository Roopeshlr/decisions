import 'dart:async';

import 'package:entities/dummy/dummy_data.dart';
import 'package:entities/order_repo.dart';
import 'package:entities/dummy/dummy_form_data.dart';

class MockOrderRepo extends OrderRepo {
  @override
  getItems() {
    List<DummyData> DummyList =[];
    DummyData DummyData1 = DummyData(name:"carzy 1" ,definitionUrl: "crazy def 1");
    DummyData DummyData2 = DummyData(name:"carzy 2" ,definitionUrl: "crazy def 2");
    DummyList.add(DummyData1);
    DummyList.add(DummyData2);
    return DummyList;
  }

  @override
  FutureOr<List<DummyFormData>> getFormData(url) {
    List<DummyFormData> DummyList =[];
    DummyFormData DummyData1 = DummyFormData(type: "text",caption: "Name",defaultValue:"" ,mandatory: true,validationMessage:"Name is mandatory" );
    DummyFormData DummyData2 = DummyFormData(type: "text",caption: "Description",defaultValue:"Please enter something here...." ,mandatory: true,validationMessage:"Oops! You can't leave it empty" );
    DummyFormData DummyData3 = DummyFormData(type: "int",caption: "Height",defaultValue:"" ,mandatory: false,validationMessage:"" );
    DummyFormData DummyData4 = DummyFormData(type: "int",caption: "width",defaultValue:"Yes" ,mandatory: false,validationMessage:"" );
    DummyFormData DummyData5 = DummyFormData(type: "bool",caption: "IsSmart",defaultValue:"false" ,mandatory: true,validationMessage:"" );


    DummyList.add(DummyData1);
    DummyList.add(DummyData2);
    DummyList.add(DummyData3);
    DummyList.add(DummyData4);
    DummyList.add(DummyData5);
    return DummyList;

  }


}
