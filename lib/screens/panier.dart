import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matcher/matcher.dart';
import 'package:mytea/Widgets/ProductTitle.dart';
import 'package:mytea/Widgets/Produit.dart';
import 'package:mytea/Widgets/ProduitPan.dart';
import 'package:mytea/models/Commandes.dart';
import 'package:provider/provider.dart';

class Panier extends StatefulWidget {
  _PanState createState() => _PanState();
}

class _PanState extends State<Panier> {
  // imgL: "assets/images/tea.png",
  //     nomProduit: "Thé vert",
  //     prix: "40Da",
  //   ),
  //   ProduitPanCard(
  //     img: true,
  //     imgL: "assets/images/croissant.png",
  //     nomProduit: "Thé vert + miel",
  //     prix: "50Da",
  //   ),
  //   ProduitPanCard(
  //     img: true,List<ProduitPanCard> liste = [
  //   ProduitPanCard(
  //     img: true,

  //     imgL: "assets/images/fraise.png",
  //     nomProduit: "Grand Thé vert + miel",
  //     prix: "70Da",
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;
    const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

    return Consumer<LiCommande>(builder: (context, list, chid) {
      return SafeArea(
        child: Scaffold(
          body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: list.len(),
                itemBuilder: (BuildContext context, int i) {
                  final item = list.itemLi(i).nomP;
                  return list.len() > 0
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
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                Provider.of<LiCommande>(context, listen: false)
                                    .del(i);
                              },
                              child: ProduitPanCard(
                                i: i,
                                nomProduit: list.itemLi(i).nomP,
                                quantite: list.itemLi(i).quantite.toString(),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 0,
                        );
                },
              ),
              list.len() > 0
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30, top: 10, bottom: 10),
                      child: Container(
                        child: RaisedButton(
                          onPressed: () {
                            print("ok");
                          },
                          color: Color(0xfff1b29e),
                          child: Text("Confirmer les achats"),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
            ],
          ),
        ),
      );
    });
  }
}
