import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final String title;
  ProductTitle({this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        SizedBox(height: 10),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                title + ":",
                style: TextStyle(fontSize: 20),
              ),
            )),
        SizedBox(height: 5),
      ],
    );
  }
}
