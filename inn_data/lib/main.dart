import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:ui/factory/module/inn_data_module.dart';
import 'package:ui/factory/view_model/inn_data_view_factory.dart';
import 'package:ui/homepage/my_home_page.dart';
import 'package:ui/formpage/form_page.dart';


Future<void> main() async {
  print('INIT MAIN');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
    usePreferences: true,
      enabled: false,
      builder: (context) => MaterialApp(
        builder: DevicePreview.appBuilder,
            home: InnDataApp(),
          )));
  InnDataModule();
  await ViewFactory().initialise();
}

class InnDataApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //return MyHomePage(title: "homepage",);
    return MyHomePage(title: "Home Page",);
  }
}

