import 'package:flutter/material.dart';

import '../models/colors.dart';

class TopBanner extends StatelessWidget {
  double height;
  String image;
  String text;
  TopBanner(this.height,this.image,this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
              height: height,
              padding: EdgeInsets.only(bottom: 30),
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  height: 270,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image)),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                        color: accentOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Center(
                        child: Text(
                          text,
                          style: TextStyle(
                              color: white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
    );
  }
}