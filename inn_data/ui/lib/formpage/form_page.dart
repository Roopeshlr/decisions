import 'package:entities/dummy/dummy_form_data.dart';
import 'package:entities/meeting_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/factory/view_model/inn_data_view_factory.dart';
import 'package:ui/formpage/form_page_view.dart';
import 'package:ui/formpage/widgets/custom_progress_indicator.dart';
import 'package:ui/formpage/widgets/primary_button.dart';

class FormPage extends StatelessWidget {
  final String title;
  final String url;

  FormPage({Key key, this.title, this.url}) : super(key: key);
  final FormPageView _view = ViewFactory().get<FormPageView>();
  final writeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(top: 24.0),
      child: Form(
        key: writeFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getFormBlocks(context),
            _getSubmitButton(context),
          ],
        ),
      ),
    ));
  }

  _getFormBlocks(context) {
    return Column(
      children: [
        TextFormField(
          onSaved: (value){ _view.onSavedTitle(value);},
          decoration: InputDecoration(
            labelText: "Title",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(),
            ),
            //fillColor: Colors.green
          ),
        ),
        TextFormField(
          onSaved: (value){ _view.onSavedDescription(value);},
          decoration: InputDecoration(
            labelText: "Description",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(),
            ),
            //fillColor: Colors.green
          ),
        ),
        RaisedButton(
          onPressed: () => _view.selectDate(context),
          child: Text("Select Date"),
        ),
        RaisedButton(
          onPressed: () => _view.selectTime(context),
          child: Text("Select Time"),
        ),
        TextFormField(
          onSaved: (value){ _view.onSavedDuration(value);},
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Meeting Duration",

            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(),
            ),
            //fillColor: Colors.green
          ),
        ),
        DropdownButton<MeetingRoom>(
            onChanged: (MeetingRoom newValue) {
              _view.onSelectMeeetingRoom(newValue);
            },
            items: MeetingRoom.values.map((MeetingRoom classType) {
              return DropdownMenuItem<MeetingRoom>(
                  value: classType, child: Text(classType.toString()));
            }).toList()),
        RaisedButton(
          onPressed: () => _view.selectRemainderTime(context),
          child: Text("Select Remainder TIme"),
        ),
      ],
    );
  }

  _getSubmitButton(context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: PrimaryButton(
        title: "Submit",
        onPressed: () {
          this.writeFormKey.currentState.save();
            _view.showSuccessPopUp(context);

        },
      ),
    );
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
}
