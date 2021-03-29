import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matcher/matcher.dart';
import 'package:mytea/Widgets/ProductTitle.dart';
import 'package:mytea/Widgets/Produit.dart';
import 'package:mytea/Widgets/ProduitPan.dart';

class Panier extends StatefulWidget {
  _PanState createState() => _PanState();
}

class _PanState extends State<Panier> {
  List<ProduitPanCard> list = [
    ProduitPanCard(
      img: true,
      imgL: "assets/images/tea.png",
      nomProduit: "Thé vert",
      prix: "40Da",
    ),
    ProduitPanCard(
      img: true,
      imgL: "assets/images/croissant.png",
      nomProduit: "Thé vert + miel",
      prix: "50Da",
    ),
    ProduitPanCard(
      img: true,
      imgL: "assets/images/fraise.png",
      nomProduit: "Grand Thé vert + miel",
      prix: "70Da",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int i) {
            final item = list[i].toStringShort();
            return list.length > 0
                ? Column(
                    children: [
                      SizedBox(height: 6),
                      Dismissible(
                        background: Container(
                          color: Colors.red,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Supprimer",
                                style: TextStyle(fontSize: 30),
                              )),
                        ),
                        key: Key(item),
                        onDismissed: (direction) {
                          list.removeAt(i);
                        },
                        child: list[i],
                      ),
                    ],
                  )
                : Center();
          },
        ),
      ),
    );
  }
}
