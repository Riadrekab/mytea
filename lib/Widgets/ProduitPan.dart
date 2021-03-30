import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mytea/models/Commandes.dart';
import 'package:provider/provider.dart';

class ProduitPanCard extends StatefulWidget {
  final String quantite;
  final String nomProduit;
  final int i;
  ProduitPanCard({this.i, this.quantite, this.nomProduit});
  _ProduitState createState() => _ProduitState();
}

class _ProduitState extends State<ProduitPanCard> {
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;

    return Consumer<LiCommande>(builder: (context, list, child) {
      return Center(
        child: Container(
          width: WidthS * 0.85,
          height: HeightS * 0.26,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ], color: Color(0xffeb9175), borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Flexible(
                      child: Text(
                        widget.nomProduit,
                        style: TextStyle(
                            fontSize: WidthS * 0.07,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Quantité: " + widget.quantite,
                      style: TextStyle(fontSize: HeightS * 0.03),
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                      color: Color(0xffF8DAD1),
                      onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return Material(
                                        type: MaterialType.transparency,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: HeightS * 0.3,
                                            width: WidthS * 0.8,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 0.5,
                                                    blurRadius: 2,
                                                    offset: Offset(0,
                                                        0), // changes position of shadow
                                                  ),
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                      "Voulez vous confirmer la suppression du panier ? ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20)),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    RaisedButton(
                                                      color: Color(0xfff1b29e),
                                                      onPressed: () {
                                                        Provider.of<LiCommande>(
                                                                context,
                                                                listen: false)
                                                            .del(widget.i);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Oui"),
                                                    ),
                                                    RaisedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Annuler"),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                                  });
                                })
                          },
                      child: Row(
                        children: [
                          Text("Supprimer du panier"),
                          Icon(FontAwesomeIcons.trash)
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
