import 'package:flutter/material.dart';
import 'package:mytea/Widgets/TabElement.dart';
import 'package:mytea/screens/Tea.dart';
import 'package:mytea/mainPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:community_material_icon/community_material_icon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        theme: ThemeData(
          fontFamily: "Kam",
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage());
  }
}
