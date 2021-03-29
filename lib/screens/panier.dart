import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matcher/matcher.dart';
import 'package:mytea/Widgets/ProductTitle.dart';
import 'package:mytea/Widgets/Produit.dart';

class Panier extends StatefulWidget {
  _PanState createState() => _PanState();
}

class _PanState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 6),
            ProduitCard(
              img: true,
              imgL: "assets/images/tea.png",
              nomProduit: "Thé vert",
              prix: "40Da",
            ),
            SizedBox(height: 6),
            ProduitCard(
              img: true,
              imgL: "assets/images/croissant.png",
              nomProduit: "Thé vert + miel",
              prix: "50Da",
            ),
            SizedBox(height: 6),
            ProduitCard(
              img: true,
              imgL: "assets/images/fraise.png",
              nomProduit: "Grand Thé vert + miel",
              prix: "70Da",
            ),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
