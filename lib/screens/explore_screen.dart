import 'package:flutter/material.dart';
import 'package:xcesscity/widgets/explore_big_row.dart';
import 'package:xcesscity/widgets/explore_row_category.dart';
import '../models/colors.dart';
import '../widgets/event_card.dart';

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
              Text("EXPLORE",
                  style: TextStyle(
                      fontSize: 25, color: white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Row(children: [
                Text("Happenings in Your Area",
                    style: TextStyle(
                        fontSize: 20,
                        color: white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Icon(Icons.location_pin, color: white, size: 20)
              ]),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  eventsCard(
                    imageUrl: "lib/assets/images/dogss.png",
                    date: "30 July",
                    title: "Missing Dog!",
                  ),
                  const SizedBox(width: 20),
                  eventsCard(
                    imageUrl: "lib/assets/images/image_9.png",
                    date: "8 Aug",
                    title: "Antenatal Class",
                  ),
                  const SizedBox(width: 20),
                  eventsCard(
                    imageUrl: "lib/assets/images/Event2.png",
                    date: "20 Aug",
                    title: "World Heart Day",
                  ),
                ]),
              ),
              //ExploreMainCard(),
              const SizedBox(height: 20),
              const ExploreRowCategory(),
              const SizedBox(height: 20),
              Text("Newest Addition",
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.bold, fontSize: 17)),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ExploreBigRow(),
                  ExploreBigRow(),
                  ExploreBigRow(),
                ]),
              ),
              const SizedBox(height: 10),
              Text("Heritage of Our City",
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.bold, fontSize: 17)),
              const SizedBox(height: 10),
              const SingleChildScrollView(
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
