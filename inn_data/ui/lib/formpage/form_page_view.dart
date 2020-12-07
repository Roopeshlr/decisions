import 'package:core_ui/base_view.dart';
import 'package:core_ui/base_view_out_state.dart';
import 'package:core_ui/base_view_state.dart';
import 'package:entities/dummy/dummy_form_data.dart';
import 'package:entities/meeting_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:ui/factory/view_model/inn_data_view_factory.dart';
import 'package:ui/formpage/form_page.dart';
import 'package:ui/homepage/my_home_page_view.dart';
import 'package:use_case/get_for_data_use_case.dart';
import 'package:rxdart/rxdart.dart';
import 'widgets/custom_check_box.dart';

class FormPageView extends BaseView<FormPageViewState, FormPageViewOutState> {
  GetFormDataUseCase _getDataUseCase;


  FormPageView(this._getDataUseCase);

  DateTime date;
  DateTime remainderDate;
  TimeOfDay remainderTime;
  TimeOfDay time;

  final MyHomePageView _homePageView = ViewFactory().get<MyHomePageView>();

  @override
  initializeOutState() {
    return FormPageViewOutState();
  }

  @override
  initializeState() {
    return FormPageViewState();
  }



  showSuccessPopUp(context) {

    state.dateTime = DateTime(date.year,date.month,date.day,time.hour,time.minute);
     DateTime RemainderTime  = DateTime(remainderDate.year,remainderDate.month,remainderDate.day,
        remainderTime.hour,remainderTime.minute);


    _homePageView.meet.add(
      MeetingListEntity(
          dateTime: state.dateTime,
          description: state.description,
          meetingRoom:state.meetingRoom,
          meetingTime: int.parse(state.meetingDuration)  ,
          priority: "High",
          reminder: RemainderTime,
          title: state.title),
    );

    _homePageView.changeSelectedDate(0);

    Navigator.pop(context);


  }





  selectTime(context)async{
    time = await showTimePicker(context: context, initialTime:  TimeOfDay.now());
  }

  selectDate(context) async {
    date = await showDatePicker(context:context , initialDate: DateTime.now(),
        firstDate:  DateTime.now(), lastDate: DateTime(2025));
  }

  void onSavedTitle(String value) {
if(value!=null){
  state.title = value;
}else{
  state.title = "no title";
}


  }

  void onSavedDescription(String value) {
    if(value!=null){
      state.description = value;
    }else{
      state.description = "no description";
    }
  }

  void onSavedDuration(String value) {
    if(value!=null){
      state.meetingDuration = value;
    }else{
      state.meetingDuration = "30";
    }

  }

  void onSelectMeeetingRoom(MeetingRoom value) {
    if(value!=null){
      state.meetingRoom = value;
    }else{
      state.meetingRoom = MeetingRoom.BLUE;
    }
  }

  selectRemainderTime(context) async {
     remainderDate = await showDatePicker(context:context , initialDate: DateTime.now(),
        firstDate:  DateTime.now(), lastDate: DateTime(2025)).then((value) async {
          remainderTime = await showTimePicker(context: context, initialTime:  TimeOfDay.now());
          return value;
     });
  }


}

class FormPageViewState extends BaseViewState {
  String title;
  String description;
  String meetingDuration;
  MeetingRoom meetingRoom;
  DateTime dateTime;
  DateTime remainderTime;
}

class FormPageViewOutState extends BaseViewOutState {}
