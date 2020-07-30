import 'package:core_ui/base_view.dart';
import 'package:core_ui/base_view_out_state.dart';
import 'package:core_ui/base_view_state.dart';
import 'package:entities/dummy/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:ui/formpage/form_page.dart';
import 'package:use_case/get_data_dart_use_case.dart';
import 'package:rxdart/rxdart.dart';

class MyHomePageView extends BaseView<MyHomePageViewState, MyHomePageViewOutState> {
  GetDataUseCase _getDataUseCase;

  MyHomePageView(this._getDataUseCase);

  @override
  initializeOutState() {
    return MyHomePageViewOutState();
  }

  @override
  initializeState() {
    return MyHomePageViewState();
  }


  navigateToFormPage(context,url){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormPage(title: "FormPage",url: url,)),
    );
  }

  Future<List<DummyData>> getData() async {
    return await _getDataUseCase.execute();
  }


}

class MyHomePageViewState extends BaseViewState {
  
}

class MyHomePageViewOutState extends BaseViewOutState {}
