import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
String defaultValue;
Function onClicked;
String validationMessage;
String title;

CheckBox({this.defaultValue,this.onClicked,this.validationMessage,this.title});

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {

  bool checkboxValue = false;

  @override
  void initState() {
   if(widget.defaultValue=="False"){
     setState(() {
       checkboxValue = false;
     });
   }else{
     setState(() {
       checkboxValue = true;
     });
   }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checkboxValue,
      onChanged: (val) {
        widget.onClicked(val);
        setState(() {
          checkboxValue = !checkboxValue;
        });
    },
      subtitle: !checkboxValue
          ? Text(
        widget.validationMessage==null ||widget.validationMessage=="" ?"":widget.validationMessage,
        style: TextStyle(color: Colors.red),
      )
          : null,
      title: new Text(
        widget.title==null ||widget.title=="" ?"Checkbox":widget.title,
        style: TextStyle(fontSize: 14.0),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.green,
    );;
  }
}