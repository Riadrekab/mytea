import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matcher/matcher.dart';
import 'package:mytea/Widgets/ProductTitle.dart';
import 'package:mytea/Widgets/Produit.dart';
import 'package:mytea/Widgets/ViennoiserieP.dart';

class Sales extends StatefulWidget {
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            ViennoisPr(
              nomP: "Pizza Tomates",
              imgL: "assets/images/pizza.png",
              prix: "30Da",
              details: "Sorti du four à 8h",
            ),
            ViennoisPr(
              nomP: "Pizza Fromage",
              imgL: "assets/images/pizzaf.png",
              prix: "40Da",
              details: "Sorti du four à 8h",
            ),
            ViennoisPr(
               nomP: "Soufflé Fromage",
              imgL: "assets/images/souff.png",
              prix: "30Da",
              details: "Sorti du four à 8h",
            )
            ],
        )),
      ),
    );
  }
}
