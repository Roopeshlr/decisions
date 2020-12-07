


enum MeetingRoom{BLUE,RED,GREEN,YELLOW}



class MeetingListEntity{
  DateTime dateTime;
  String title;
  String description;
  int meetingTime;
  MeetingRoom meetingRoom;
  String priority;
  DateTime reminder;
  MeetingListEntity({this.dateTime,this.title, this.description, this.meetingTime,
      this.meetingRoom, this.priority, this.reminder});
}