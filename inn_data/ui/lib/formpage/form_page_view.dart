import 'package:core_ui/base_view.dart';
import 'package:core_ui/base_view_out_state.dart';
import 'package:core_ui/base_view_state.dart';
import 'package:entities/dummy/dummy_form_data.dart';
import 'package:flutter/material.dart';
import 'package:ui/formpage/form_page.dart';
import 'package:use_case/get_for_data_use_case.dart';
import 'package:rxdart/rxdart.dart';
import 'widgets/custom_check_box.dart';

class FormPageView extends BaseView<FormPageViewState, FormPageViewOutState> {
  GetFormDataUseCase _getDataUseCase;


  FormPageView(this._getDataUseCase);

  BehaviorSubject<bool> checkboxValue = BehaviorSubject();
  BehaviorSubject<bool> mandatoryValue = BehaviorSubject();


  Widget widgetSwitcher(DummyFormData data) {
    switch(data.type){
      case "text":
        return TextFormField(
          decoration: new InputDecoration(
            labelText: data.caption !=null?data.caption:"",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(
              ),
            ),
            //fillColor: Colors.green
          ),
          validator: data.mandatory?(value){
            if(value==null || value=="") {
              return data.validationMessage;
            }else{
              return null;
            }
          }:null,
        );
      case "int":
        return TextFormField(
          initialValue: data.defaultValue,
          decoration: new InputDecoration(
            labelText: data.caption !=null?data.caption:"",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(
              ),
            ),
            //fillColor: Colors.green
          ),
          keyboardType: TextInputType.number,
          validator: data.mandatory?(value){
            if(value==null || value=="") {
              return data.validationMessage;
            }else{
              return null;
            }
          }:null,
        );
      case "bool":
        _addMandatoryToState(data.mandatory);
        _addDefaultValueToState(data.defaultValue);
        return CheckBox(title: data.caption,validationMessage: data.validationMessage,defaultValue: data.defaultValue,onClicked: (val){
          print(val);
          checkboxValue.add(val);
        },);
        break;
      default:
        return Container();
    }

  }

  @override
  initializeOutState() {
    return FormPageViewOutState();
  }

  @override
  initializeState() {
    return FormPageViewState();
  }




  Future<List<DummyFormData>> getFormData(baseUrl) async {
    return await _getDataUseCase.execute(baseUrl).then((value){
      return value;
    });
  }
  showSuccessPopUp(context) {
      if(checkboxValue.value || !mandatoryValue.value){
        final _snackBar = SnackBar(content: Text("Form Submitted"));
        Scaffold.of(context).showSnackBar(_snackBar);
      }else{
        final _snackBar = SnackBar(content: Text("Please Check the CheckBox "));
        Scaffold.of(context).showSnackBar(_snackBar);
      }
  }

   _addDefaultValueToState(String data) {
    print(data);

    if(data=="False"){
      checkboxValue.add(false);
    }else{
      checkboxValue.add(true);
    }
  }

  void _addMandatoryToState(bool mandatory) {
    print("mandatory $mandatory");
    mandatoryValue.add(mandatory);
  }


}

class FormPageViewState extends BaseViewState {
  
}

class FormPageViewOutState extends BaseViewOutState {}
