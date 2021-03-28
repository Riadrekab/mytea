import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;

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
                      style:TextStyle(fontSize: WidthS*0.05),
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
                    onPressed: () => {print('ok')},
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
  }
}
