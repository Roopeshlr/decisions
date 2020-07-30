import 'package:entities/dummy/dummy_form_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/factory/view_model/inn_data_view_factory.dart';
import 'package:ui/formpage/form_page_view.dart';
import 'package:ui/formpage/widgets/custom_progress_indicator.dart';
import 'package:ui/formpage/widgets/primary_button.dart';


class FormPage extends StatelessWidget {
  final String title;
  final String url;

  FormPage({Key key, this.title,this.url}) : super(key: key);
  final FormPageView _view = ViewFactory().get<FormPageView>();
  final writeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppBar(),
      body:_buildBody(),
    );
  }

  _buildBody() {
    return  SingleChildScrollView(
      child: FutureBuilder<List<DummyFormData>>(
          future: _view.getFormData(url),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CustomProgressIndicator();
            return Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Form(
                key:writeFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _getFormBlocks(context,snapshot.data),
                    _getSubmitButton(context),
                  ],
                ),
              ),
            );
          }),
    );
  }

  _getFormBlocks(context,data) {
    return Container(
      height: MediaQuery.of(context).size.height-200,
      child:  ListView.separated(
          separatorBuilder: (context,index){
            return Padding(padding: EdgeInsets.all(12.0),child: Divider(height: 12,),);
          },
          itemCount: data.length,
          itemBuilder: (BuildContext context,index){
            return Padding(
              padding: const EdgeInsets.only(right:24.0,left: 24.0,),
              child: _view.widgetSwitcher(data[index]),
            );

          }),
    );
  }

  _getSubmitButton(context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: PrimaryButton(title: "Submit",onPressed: (){
        if (this.writeFormKey.currentState.validate()) {
          _view.showSuccessPopUp(context);
        }
      },),
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





