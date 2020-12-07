import 'package:entities/dummy/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/factory/view_model/inn_data_view_factory.dart';
import 'package:ui/formpage/widgets/custom_progress_indicator.dart';
import 'package:ui/homepage/my_home_page_view.dart';
import 'package:entities/meeting_list_entity.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);
  final MyHomePageView _view = ViewFactory().get<MyHomePageView>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
           _view.navigateToFormPage(context, "askmads");
          },
          child: Icon(Icons.add),
        ),
        body: _buildBody());
  }

  _buildBody() => FutureBuilder<List<DateTime>>(
      future: _view.getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CustomProgressIndicator();
        return Column(
          children: [
            _buildContent(context, snapshot.data),
            _buildMeetingScreen(),
          ],
        );
      });

  _buildContent(context, List<DateTime> data) {
    return Container(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _view.changeSelectedDate(index);
              },
              child: _buildTextWidget(data[index].toString()),
            );
          }),
    );
  }

  _buildTextWidget(String TimeStamp) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          "${DateTime.parse(TimeStamp).day} - ${DateTime.parse(TimeStamp).month}"),
    ));
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: GoogleFonts.roboto(fontSize: 24, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Color(0xff0681e1),
    );
  }

  _buildMeetingScreen() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Blue Room"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            StreamBuilder<List<MeetingListEntity>>(
                stream: _view.state.currentDateMeetingValues,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 40,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            if (snapshot.data[index].meetingRoom ==
                                MeetingRoom.BLUE) {
                              return Text(snapshot.data[index].description);
                            } else {
                              return SizedBox();
                            }
                          }),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("RED Room"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            StreamBuilder<List<MeetingListEntity>>(
                stream: _view.state.currentDateMeetingValues,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 40,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            if (snapshot.data[index].meetingRoom ==
                                MeetingRoom.RED) {
                              return Text(snapshot.data[index].description);
                            } else {
                              return SizedBox();
                            }
                          }),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Green Room"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            StreamBuilder<List<MeetingListEntity>>(
                stream: _view.state.currentDateMeetingValues,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 40,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            if (snapshot.data[index].meetingRoom ==
                                MeetingRoom.GREEN) {
                              return Text(snapshot.data[index].description);
                            } else {
                              return SizedBox();
                            }
                          }),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Yellow Room"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            StreamBuilder<List<MeetingListEntity>>(
                stream: _view.state.currentDateMeetingValues,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 40,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            if (snapshot.data[index].meetingRoom ==
                                MeetingRoom.YELLOW) {
                              return Text(snapshot.data[index].description);
                            } else {
                              return SizedBox();
                            }
                          }),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );

    // return StreamBuilder<List<MeetingListEntity>>(
    //     stream: _view.state.currentDateMeetingValues,
    //     builder: (BuildContext context, snapshot) {
    //       if (snapshot.hasData) {
    //         return Container(
    //           height: 40,
    //           child: ListView.builder(
    //               itemCount: snapshot.data.length,
    //               itemBuilder: (context, index) {
    //                 return Text(snapshot.data[index].description);
    //               }),
    //         );
    //       } else {
    //         return CircularProgressIndicator();
    //       }
    //     });
  }
}
