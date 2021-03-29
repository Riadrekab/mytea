import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mytea/screens/Tea.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mytea/Widgets/TabElement.dart';
import 'package:mytea/screens/Viennoiserie.dart';
import 'package:mytea/screens/panier.dart';
import 'package:mytea/screens/sales.dart';

class MainPage extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;

    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(HeightS * 0.23),
            child: AppBar(
              actions: [
                Icon(
                  CommunityMaterialIcons.cog,
                  color: Colors.black,
                  size: HeightS * 0.07,
                )
              ],
              titleSpacing: 10,
              backgroundColor: Color(0xffF8DAD1),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: Container(
                  height: HeightS * 0.125,
                  child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Color(0xffDE4719),
                    indicatorColor: Color(0xffDE4719),
                    tabs: [
                      TabEl(
                        icon: CommunityMaterialIcons.tea,
                        text: "Boissons",
                      ),
                      TabEl(
                          icon: CommunityMaterialIcons.food_croissant,
                          text: "Viennoiserie"),
                      TabEl(icon: LineIcons.pizzaSlice, text: "Salés"),
                      TabEl(
                        icon: CommunityMaterialIcons.basket,
                        text: "Panier",
                      )
                    ],
                  ),
                ),
              ),
              title: Text('MyTea',
                  style:
                      TextStyle(color: Colors.black, fontSize: HeightS * 0.07)),
            ),
          ),
          body: TabBarView(
            children: [
              Tea(),
              Viennoiserie(),
              Sales(),
              Panier(),
            ],
          ),
        ),
      ),
    );
  }
}
