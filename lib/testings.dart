import 'package:flutter/material.dart';
import 'package:weather_app/widgets/navigation_drawer_widget.dart';

class testings extends StatelessWidget {
  testings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text("About Us"),
    centerTitle: true,
    backgroundColor: Colors.green,
    ),
  );
}
