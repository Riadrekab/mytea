import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matcher/matcher.dart';
import 'package:mytea/Widgets/ProductTitle.dart';
import 'package:mytea/Widgets/Produit.dart';
import 'package:mytea/Widgets/ViennoiserieP.dart';

class Viennoiserie extends StatefulWidget {
  _ViennoiserieState createState() => _ViennoiserieState();
}

class _ViennoiserieState extends State<Viennoiserie> {
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            ProductTitle(
              title: "Viennoiserie",
            ),
            Container(
              height: HeightS * 0.63,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ViennoisPr(
                    nomP: "Croissant",
                    imgL: "assets/images/croissant.png",
                    prix: "40Da",
                    details: "Sorti du four à 8h",
                  ),
                  ViennoisPr(
                    nomP: "Pain au chocolat",
                    imgL: "assets/images/pain.png",
                    prix: "40Da",
                    details: "Sorti du four à 8h",
                  ),
                ],
              ),
            ),
            ProductTitle(
              title: "Patisserie",
            ),
            Container(
              height: HeightS * 0.63,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ViennoisPr(
                    nomP: "Tarte chocolat",
                    imgL: "assets/images/cake.png",
                    prix: "40Da",
                    details: "Sorti du four à 8h",
                  ),
                  ViennoisPr(
                    nomP: "rouller",
                    imgL: "assets/images/roller.png",
                    prix: "40Da",
                    details: "Sorti du four à 8h",
                  ),
                  ViennoisPr(
                    nomP: "Tarte aux fraises",
                    imgL: "assets/images/fraise.png",
                    prix: "40Da",
                    details: "Sorti du four à 8h",
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
