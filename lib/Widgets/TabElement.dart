import 'package:flutter/material.dart';

class TabEl extends StatelessWidget {
  final IconData icon;
  final String text;
  TabEl({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    double WidthS = MediaQuery.of(context).size.width;
    double HeightS = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Container(
      height: HeightS * 0.125,
      width: WidthS * 0.25,
      child: Tab(
        child: Column(
          children: [
            Container(
              width: WidthS * 0.3,
              height: HeightS * 0.08,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Icon(
                this.icon,
                size: WidthS * 0.1,
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(fontSize: WidthS * 0.032),
            )
          ],
        ),
      ),
    );
  }
}
