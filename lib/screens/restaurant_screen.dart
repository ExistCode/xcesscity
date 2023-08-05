import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';

import '../widgets/crime_map.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});
  static const routeName = '/restaurant';

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => {Navigator.of(context).pop()},
                      child: Icon(Icons.keyboard_arrow_left_rounded,
                          color: white, size: 50),
                    ),
                    Text("Restaurants",
                        style: TextStyle(
                            fontSize: 25,
                            color: white,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: TextField(
                  style: TextStyle(color: black),
                  controller: searchController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Search for Restaurants...",
                    suffixIcon: Icon(Icons.search, color: black),
                    filled: true,
                    fillColor: white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 5)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 310,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.hardEdge,
                child: CrimeMap(),
              ),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Nearest Restaurants",
                    style: TextStyle(
                        fontSize: 20,
                        color: white,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20))),
                height: 120,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                          image:
                              AssetImage('lib/assets/images/restaurant1.png')),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: accentOrange,
                        ),
                        height: 128,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dragon-I Peking Duck",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.bold)),
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  width: 75,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: white),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: secondary,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("4.5",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: secondary,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
