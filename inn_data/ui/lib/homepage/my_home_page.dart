import 'package:entities/dummy/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/factory/view_model/inn_data_view_factory.dart';
import 'package:ui/formpage/widgets/custom_progress_indicator.dart';
import 'package:ui/homepage/my_home_page_view.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);
  final MyHomePageView _view = ViewFactory().get<MyHomePageView>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: _buildBody());
  }

  _buildBody() => FutureBuilder<List<DummyData>>(
      future: _view.getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CustomProgressIndicator();
        return _buildContent(context, snapshot.data);
      });

  _buildContent(context, data) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      height: MediaQuery.of(context).size.height * 0.75,
      child: ListView.separated(
          separatorBuilder: (BuildContext context, index) {
            return Padding(
              padding: EdgeInsets.all(24.0),
              child: Divider(
                height: 23,
              ),
            );
          },
          itemCount: data.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(
                data[index].name,
                style:
                    GoogleFonts.adamina(fontSize: 24, color: Colors.blueGrey),
              ),
              trailing: IconButton(
                  icon: Icon(
                Icons.arrow_forward_ios,
                size: 28,
              )),
              onTap: () {
                _view.navigateToFormPage(context, data[index].definitionUrl);
              },
            );
          }),
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
