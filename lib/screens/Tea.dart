import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matcher/matcher.dart';
import 'package:mytea/Widgets/ProductTitle.dart';
import 'package:mytea/Widgets/Produit.dart';

class Tea extends StatefulWidget {
  _TeaState createState() => _TeaState();
}

class _TeaState extends State<Tea> {
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 6),
            ProductTitle(
              title: "Varitéthés de thés",
            ),
            SizedBox(height: 6),
            Container(
              height: HeightS * 0.23,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 6),
                  ProduitCard(
                    img: true,
                    imgL: "assets/images/tea.png",
                    nomProduit: "Thé vert",
                    prix: "40Da",
                  ),
                  SizedBox(width: 6),
                  ProduitCard(
                    img: true,
                    imgL: "assets/images/tea.png",
                    nomProduit: "Thé vert + miel",
                    prix: "50Da",
                  ),
                  SizedBox(width: 6),
                  ProduitCard(
                    img: true,
                    imgL: "assets/images/tea.png",
                    nomProduit: "Grand Thé vert + miel",
                    prix: "70Da",
                  ),
                  SizedBox(width: 6),
                ],
              ),
            ),
            ProductTitle(
              title: "Eaux minérales",
            ),
            SizedBox(height: 6),
            Container(
              height: HeightS * 0.23,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 6),
                  ProduitCard(
                    img: false,
                    imgL: "assets/images/tea.png",
                    icon: Icon(
                      CommunityMaterialIcons.cup_water,
                      color: Colors.blue,
                      size: HeightS * 0.1,
                    ),
                    nomProduit: "Guedila 1.5L ",
                    prix: "30Da",
                  ),
                  SizedBox(width: 6),
                  ProduitCard(
                    img: false,
                    imgL: "assets/images/tea.png",
                    icon: Icon(
                      CommunityMaterialIcons.cup_water,
                      color: Colors.blue,
                      size: HeightS * 0.1,
                    ),
                    nomProduit: "Guedila 0.5L",
                    prix: "20Da",
                  ),
                  SizedBox(width: 6),
                  ProduitCard(
                    img: false,
                    imgL: "assets/images/tea.png",
                    icon: Icon(
                      CommunityMaterialIcons.cup_water,
                      color: Colors.blue,
                      size: HeightS * 0.1,
                    ),
                    nomProduit: "Guedila 1L",
                    prix: "25Da",
                  ),
                  SizedBox(width: 6),
                ],
              ),
            ),
            ProductTitle(title: "Sodas"),
            Container(
              height: HeightS * 0.23,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 6),
                  ProduitCard(
                    img: false,
                    imgL: "assets/images/tea.png",
                    icon: Icon(
                      CommunityMaterialIcons.bottle_soda,
                      color: Colors.red,
                      size: HeightS * 0.15,
                    ),
                    nomProduit: "Coca Cola",
                    prix: "60Da",
                  ),
                  SizedBox(width: 6),
                  ProduitCard(
                    img: false,
                    imgL: "assets/images/tea.png",
                    icon: Icon(
                      CommunityMaterialIcons.bottle_soda,
                      color: Colors.red,
                      size: HeightS * 0.15,
                    ),
                    nomProduit: "Pepsi",
                    prix: "60Da",
                  ),
                  SizedBox(width: 6),
                  ProduitCard(
                    img: false,
                    imgL: "assets/images/tea.png",
                    icon: Icon(
                      CommunityMaterialIcons.bottle_soda,
                      color: Colors.red,
                      size: HeightS * 0.15,
                    ),
                    nomProduit: "Selecto",
                    prix: "60Da",
                  ),
                  SizedBox(width: 6),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}

//   Center(
//     child: Container(
//       width: screensize.width * 0.9,
//       height: screensize.height*0.08,
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey, width: 1.4),
//           borderRadius: BorderRadius.circular(20)),
//       child: TextFormField(
//         decoration: InputDecoration(
//           prefixText: " ",
//             suffixIcon: Icon(
//               Icons.search,
//               size: 40,
//             ),
//             border: InputBorder.none,
//             focusedBorder: InputBorder.none,
//             enabledBorder: InputBorder.none,
//             errorBorder: InputBorder.none,
//             disabledBorder: InputBorder.none,
//             labelStyle: TextStyle(color: Colors.grey),
//             labelText: ' Aa'),
//       ),
//     ),
//   ),
// ],
