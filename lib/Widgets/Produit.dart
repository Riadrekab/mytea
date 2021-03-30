import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mytea/models/Commandes.dart';
import 'package:provider/provider.dart';

class ProduitCard extends StatefulWidget {
  String imgL;
  bool img;
  final String prix;
  final String nomProduit;
  Icon icon;
  ProduitCard({this.icon, this.img, this.imgL, this.prix, this.nomProduit});
  _ProduitState createState() => _ProduitState();
}

class _ProduitState extends State<ProduitCard> {
  int _nbreservation = 0;
  TimeOfDay time = TimeOfDay.now();
  selectTime() async {
    TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: time,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: Directionality(
              child: child,
              textDirection: TextDirection.ltr,
            ),
          );
        });
    if (picked != null) {
      setState(() {
        time = picked;
      });
    }
  }

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
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: HeightS * 0.2,
                width: WidthS * 0.28,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    image: widget.img
                        ? DecorationImage(
                            image: AssetImage(
                              widget.imgL,
                            ),
                            fit: BoxFit.contain,
                            colorFilter: ColorFilter.mode(
                                Colors.transparent, BlendMode.color))
                        : DecorationImage(
                            image: AssetImage(
                              widget.imgL,
                            ),
                            fit: BoxFit.contain,
                            colorFilter: ColorFilter.mode(
                                Colors.transparent, BlendMode.modulate)),
                    borderRadius: BorderRadius.circular(20)),
                child: !widget.img
                    ? Center(
                        child: widget.icon,
                      )
                    : Container(),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Flexible(
                      child: Text(
                        widget.nomProduit,
                        style: TextStyle(fontSize: WidthS * 0.05),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Prix de base: " + widget.prix,
                      style: TextStyle(fontSize: HeightS * 0.03),
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                      color: Color(0xffF8DAD1),
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return Material(
                                type: MaterialType.transparency,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: HeightS * 0.6,
                                      width: WidthS * 0.8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              width: WidthS,
                                              height: HeightS * 0.03,
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                                    "La quantité de votre commande"),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 12.0),
                                            child: Container(
                                                height: HeightS * 0.07,
                                                width: WidthS * 0.4,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                        onTap: () => {
                                                              setState(() {
                                                                if (_nbreservation >
                                                                    0) {
                                                                  _nbreservation--;
                                                                }
                                                              })
                                                            },
                                                        child: Icon(
                                                          FontAwesomeIcons
                                                              .minus,
                                                          size: WidthS * 0.1,
                                                        )),
                                                    Text('$_nbreservation',
                                                        style: TextStyle(
                                                            fontSize:
                                                                WidthS * 0.1)),
                                                    InkWell(
                                                        onTap: () => {
                                                              setState(() {
                                                                _nbreservation++;
                                                              })
                                                            },
                                                        child: Icon(
                                                          FontAwesomeIcons.plus,
                                                          size: WidthS * 0.1,
                                                        )),
                                                  ],
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      spreadRadius: 0.9,
                                                      blurRadius: 5,
                                                      offset: Offset(0,
                                                          0), // changes position of shadow
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8.0),
                                            child: Text(
                                              "A quelle heure allez vous récupérer la commande ?",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                selectTime();
                                              },
                                              child: Container(
                                                width: WidthS * 0.4,
                                                height: HeightS * 0.1,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        spreadRadius: 0.9,
                                                        blurRadius: 5,
                                                        offset: Offset(0,
                                                            0), // changes position of shadow
                                                      ),
                                                    ],
                                                    color: Color(0xfff1b29e),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Icon(Icons.alarm),
                                                      Text(
                                                        ' ${time.hour}:${time.minute}',
                                                        style: TextStyle(
                                                            fontSize: 30),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              RaisedButton(
                                                color: Color(0xfff1b29e),
                                                onPressed: () {
                                                  if (_nbreservation <= 0) {
                                                    final snackBar = SnackBar(
                                                        backgroundColor:
                                                            Colors.black,
                                                        content: Text(
                                                            'La quantité de commande ne peut pas être égale à 0'));

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  } else {
                                                    Commande cmd =
                                                        Commande.constructor(
                                                            widget.nomProduit,
                                                            _nbreservation);
                                                    Provider.of<LiCommande>(
                                                            context,
                                                            listen: false)
                                                        .addCmd(cmd);
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Text("Confirmer"),
                                              ),
                                              RaisedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("retour"),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            });
                          }),
                      child: Row(
                        children: [
                          Text("Ajouter au panier"),
                          Icon(FontAwesomeIcons.cartPlus)
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
