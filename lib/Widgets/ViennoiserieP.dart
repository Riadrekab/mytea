import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mytea/models/Commandes.dart';
import 'package:provider/provider.dart';

class ViennoisPr extends StatefulWidget {
  final String imgL;
  final String nomP;
  final String prix;
  final String details;

  ViennoisPr({this.imgL, this.nomP, this.prix, this.details});

  _ViennoisState createState() => _ViennoisState();
}

class _ViennoisState extends State<ViennoisPr> {
  TimeOfDay time = TimeOfDay.now();
  int _nbreservation = 0;

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
    final String imgL = widget.imgL;
    final String nomP = widget.nomP;
    final String prix = widget.prix;
    final String details = widget.details;

    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;

    return Consumer<LiCommande>(builder: (context, list, child) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xfff1b29e),
            ),
            width: WidthS * 0.7,
            height: HeightS * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Container(
                  height: HeightS * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imgL), fit: BoxFit.contain)),
                ),
                SizedBox(height: HeightS * 0.04),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 5),
                  child: Text(
                    nomP,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 5),
                  child: Text(
                    details,
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 5),
                  child: Text(
                    "Prix :" + prix,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: WidthS * 0.5,
                    child: RaisedButton(
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
                                              height: HeightS * 0.6,
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
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
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
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                                      setState(
                                                                          () {
                                                                        if (_nbreservation >
                                                                            0) {
                                                                          _nbreservation--;
                                                                        }
                                                                      })
                                                                    },
                                                                child: Icon(
                                                                  FontAwesomeIcons
                                                                      .minus,
                                                                  size: WidthS *
                                                                      0.1,
                                                                )),
                                                            Text(
                                                                '$_nbreservation',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        WidthS *
                                                                            0.1)),
                                                            InkWell(
                                                                onTap: () => {
                                                                      setState(
                                                                          () {
                                                                        _nbreservation++;
                                                                      })
                                                                    },
                                                                child: Icon(
                                                                  FontAwesomeIcons
                                                                      .plus,
                                                                  size: WidthS *
                                                                      0.1,
                                                                )),
                                                          ],
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.3),
                                                              spreadRadius: 0.9,
                                                              blurRadius: 5,
                                                              offset: Offset(0,
                                                                  0), // changes position of shadow
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8.0),
                                                    child: Text(
                                                      "A quelle heure allez vous récupérer la commande ?",
                                                      style: TextStyle(
                                                          fontSize: 20),
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
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.3),
                                                                spreadRadius:
                                                                    0.9,
                                                                blurRadius: 5,
                                                                offset: Offset(
                                                                    0,
                                                                    0), // changes position of shadow
                                                              ),
                                                            ],
                                                            color: Color(
                                                                0xfff1b29e),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Center(
                                                          child: Column(
                                                            children: [
                                                              Icon(Icons.alarm),
                                                              Text(
                                                                ' ${time.hour}:${time.minute}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        30),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      RaisedButton(
                                                        color:
                                                            Color(0xfff1b29e),
                                                        onPressed: () {
                                                          if (_nbreservation <=
                                                              0) {
                                                            final snackBar = SnackBar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                                content: Text(
                                                                    'La quantité de commande ne peut pas être égale à 0'));

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    snackBar);
                                                          } else {
                                                            Commande cmd = Commande
                                                                .constructor(
                                                                    widget.nomP,
                                                                    _nbreservation);
                                                            Provider.of<LiCommande>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .addCmd(cmd);

                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        },
                                                        child:
                                                            Text("Confirmer"),
                                                      ),
                                                      RaisedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
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
                                  })
                            },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Ajouter au panier"),
                            Icon(FontAwesomeIcons.cartPlus)
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
// Align(
//                                           alignment: Alignment.center,
//                                           child: Container(
//                                             height: HeightS * 0.5,
//                                             width: WidthS * 0.8,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(20),
//                                                 color: Colors.white),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets.all(
//                                                       12.0),
//                                                   child: Container(
//                                                     width: WidthS,
//                                                     height: HeightS * 0.03,
//                                                     child: FittedBox(
//                                                       fit: BoxFit.fitWidth,
//                                                       child: Text(
//                                                           "La quantité de votre commande"),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           bottom: 12.0),
//                                                   child: Container(
//                                                       height: HeightS * 0.05,
//                                                       width: WidthS * 0.4,
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceEvenly,
//                                                         children: [
//                                                           InkWell(
//                                                               onTap: () => {
//                                                                     setState(
//                                                                         () {
//                                                                       if (_nbreservation >
//                                                                           0) {
//                                                                         _nbreservation--;
//                                                                       }
//                                                                     })
//                                                                   },
//                                                               child: Icon(
//                                                                 FontAwesomeIcons
//                                                                     .minus,
//                                                                 size: WidthS *
//                                                                     0.05,
//                                                               )),
//                                                           Text(
//                                                               '$_nbreservation',
//                                                               style: TextStyle(
//                                                                   fontSize:
//                                                                       WidthS *
//                                                                           0.05)),
//                                                           InkWell(
//                                                               onTap: () => {
//                                                                     setState(
//                                                                         () {
//                                                                       _nbreservation++;
//                                                                     })
//                                                                   },
//                                                               child: Icon(
//                                                                 FontAwesomeIcons
//                                                                     .plus,
//                                                                 size: WidthS *
//                                                                     0.05,
//                                                               )),
//                                                         ],
//                                                       ),
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(20),
//                                                         color: Colors.white,
//                                                         boxShadow: [
//                                                           BoxShadow(
//                                                             color: Colors.grey
//                                                                 .withOpacity(
//                                                                     0.3),
//                                                             spreadRadius: 0.9,
//                                                             blurRadius: 5,
//                                                             offset: Offset(0,
//                                                                 0), // changes position of shadow
//                                                           ),
//                                                         ],
//                                                       )),
//                                                 ),
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           left: 8.0,
//                                                           right: 8.0),
//                                                   child: Text(
//                                                     "A quelle heure allez vous récupérer la commande ?",
//                                                     style:
//                                                         TextStyle(fontSize: 20),
//                                                   ),
//                                                 ),
//                                                 GestureDetector(
//                                                     onTap: () {
//                                                       selectTime(context);
//                                                     },
//                                                     child: Container(
//                                                       width: WidthS * 0.4,
//                                                       height: HeightS * 0.1,
//                                                       decoration: BoxDecoration(
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors.grey
//                                                                   .withOpacity(
//                                                                       0.3),
//                                                               spreadRadius: 0.9,
//                                                               blurRadius: 5,
//                                                               offset: Offset(0,
//                                                                   0), // changes position of shadow
//                                                             ),
//                                                           ],
//                                                           color:
//                                                               Color(0xfff1b29e),
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       20)),
//                                                       child: Center(
//                                                         child: Column(
//                                                           children: [
//                                                             Icon(Icons.alarm),
//                                                             Text(
//                                                               ' ${time.hour}:${time.minute}',
//                                                               style: TextStyle(
//                                                                   fontSize: 30),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ))
//                                               ],
//                                             ),
//                                           )),
