import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/colors.dart';

class TopBanner extends StatelessWidget {
  double height;
  String image;
  String text;
  TopBanner(this.height,this.image,this.text,);

  @override
  Widget build(BuildContext context) {
    return Container(
              height: height,
              padding: EdgeInsets.only(bottom: 30),
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  height: height-40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit:BoxFit.cover,
                          image: AssetImage(image)),
                      
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(          
                    padding:EdgeInsets.symmetric(vertical:6,horizontal:8),        
                    height: 40,
                    width:200,                   
                    decoration: BoxDecoration(
                        color: accentOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Center(
                        child: AutoSizeText(                          
                          text,
                          style: TextStyle(                            
                              color: white, fontSize: 18, fontWeight: FontWeight.w700),
                              maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
    );
  }
}