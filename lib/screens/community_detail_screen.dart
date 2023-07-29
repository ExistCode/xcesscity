import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart' as custom_colors;
import 'package:xcesscity/widgets/donation_card.dart';
import 'package:xcesscity/widgets/news_community_card.dart';

import '../navigation.dart';
import '../widgets/event_card.dart';

class CommunityDetailScreen extends StatefulWidget {
  static const routeName = '/communitydetail';

  const CommunityDetailScreen({super.key});

  @override
  State<CommunityDetailScreen> createState() => _CommunityDetailScreenState();
}

BottomNavigationBar get navigationBar {
  return NavigationState.globalKey.currentWidget as BottomNavigationBar;
}

class _CommunityDetailScreenState extends State<CommunityDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_colors.backgroundBlack,
        leading: IconButton(
          padding: EdgeInsets.only(left: 16),
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 28,
            color: custom_colors.accentOrange,
          ),
        ),
        titleSpacing: 0,
        title: Text(
          "PLACES_NAME",
          style: TextStyle(
              fontSize: 24,
              color: custom_colors.accentOrange,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 28, top: 8),
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(color: custom_colors.white),
              child: Text(
                "NEWS",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: custom_colors.secondary),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.0),
              child: newsCommunityCard(),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(left: 28),
              child: Text(
                "EVENTS",
                style: TextStyle(
                    fontSize: 16,
                    color: custom_colors.secondary,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                eventsCard(),
                SizedBox(
                  width: 24,
                ),
                eventsCard(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 28),
              child: Text(
                "DONATION",
                style: TextStyle(
                    fontSize: 16,
                    color: custom_colors.secondary,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                donationCard(),
                SizedBox(
                  width: 24,
                ),
                donationCard()
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 52,
                width: 332,
                decoration: BoxDecoration(
                    color: custom_colors.accentOrange,
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  "Pay Gated and Garden Services",
                  style: TextStyle(
                      color: custom_colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
