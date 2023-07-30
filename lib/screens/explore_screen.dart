import 'package:flutter/material.dart';
import 'package:xcesscity/widgets/explore_big_row.dart';
import 'package:xcesscity/widgets/explore_row_category.dart';
import '../models/colors.dart';
import '../widgets/explore_main_card.dart';

class ExploreScreen extends StatefulWidget {
  static const routeName = '/explore';
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 60,
              top: MediaQuery.of(context).padding.top + 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExploreMainCard(),
              SizedBox(height: 20),
              ExploreRowCategory(),
              SizedBox(height: 20),
              Text("Newest Addition",
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.bold, fontSize: 17)),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ExploreBigRow(),
                  ExploreBigRow(),
                  ExploreBigRow(),
                ]),
              ),
              SizedBox(height: 10),
              Text("Newest Addition",
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.bold, fontSize: 17)),
              SizedBox(height: 10),
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ExploreBigRow(),
                  ExploreBigRow(),
                  ExploreBigRow(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
