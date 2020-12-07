import 'package:core_ui/base_view.dart';
import 'package:core_ui/base_view_out_state.dart';
import 'package:core_ui/base_view_state.dart';
import 'package:entities/meeting_list_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/formpage/form_page.dart';
import 'package:use_case/get_data_dart_use_case.dart';
import 'package:rxdart/rxdart.dart';

class MyHomePageView
    extends BaseView<MyHomePageViewState, MyHomePageViewOutState> {
  GetDataUseCase _getDataUseCase;
  List<DateTime> items;
  MyHomePageView(this._getDataUseCase);

  MeetingListEntity noEvent = MeetingListEntity(
      dateTime: DateTime.now(),
      description: "No Events",
      meetingRoom: MeetingRoom.BLUE,
      meetingTime: 30,
      priority: "High",
      reminder: DateTime.now(),
      title: "first one");

  List<MeetingListEntity> meet = [
    // MeetingListEntity(
    //     dateTime: DateTime.now(),
    //     description: "First date 4",
    //     meetingRoom: MeetingRoom.BLUE,
    //     meetingTime: 30,
    //     priority: "High",
    //     reminder: DateTime.now(),
    //     title: "first one"),
    // MeetingListEntity(
    //     dateTime: DateTime.now(),
    //     description: "First date 5",
    //     meetingRoom: MeetingRoom.BLUE,
    //     meetingTime: 30,
    //     priority: "High",
    //     reminder: DateTime.now(),
    //     title: "first one"),
    // MeetingListEntity(
    //     dateTime: DateTime.utc(
    //       DateTime.now().year,
    //       DateTime.now().month,
    //       DateTime.now().day,
    //     ).add(Duration(days: 2)),
    //     description: "First date 2",
    //     meetingRoom: MeetingRoom.YELLOW,
    //     meetingTime: 30,
    //     priority: "High",
    //     reminder: DateTime.now(),
    //     title: "first one 2"),
  ];

  @override
  initializeOutState() {
    return MyHomePageViewOutState();
  }

  @override
  initializeState() {
    BehaviorSubject<List<MeetingListEntity>> _currentDatemeetingList2 =
        BehaviorSubject();
    createListOfDates();

    _currentDatemeetingList2.value = meet.where((element) {
      if (DateTime.parse(element.dateTime.toString()).day ==
          DateTime.now().day) {
        return true;
      } else {
        return false;
      }
    }).toList();

    return MyHomePageViewState(_currentDatemeetingList2);
  }

  createListOfDates() {
    items = List<DateTime>.generate(
        60,
        (i) => DateTime.utc(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ).add(Duration(days: i)));
  }

  navigateToFormPage(context, url) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FormPage(
                title: "FormPage",
                url: url,
              )),
    );
  }

  Future<List<DateTime>> getData() async {
    return items;
  }

  changeSelectedDate(int index) {
    List<MeetingListEntity> changedMeetingDate = meet.where((element) {
      if (DateTime.parse(element.dateTime.toString()).day ==
          DateTime.parse(items[index].toString()).day) {
        return true;
      } else {
        return false;
      }
    }).toList();

    state.currentDatemeetingList.add(changedMeetingDate);
  }
}

class MyHomePageViewState extends BaseViewState {
  BehaviorSubject<List<MeetingListEntity>> currentDatemeetingList =
      BehaviorSubject();

  Stream<List<MeetingListEntity>> get currentDateMeetingValues =>
      currentDatemeetingList.stream;

  MyHomePageViewState(this.currentDatemeetingList);
}

class MyHomePageViewOutState extends BaseViewOutState {}
