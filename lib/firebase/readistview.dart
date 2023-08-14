import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class ReadListView extends StatefulWidget {
  const ReadListView({super.key});

  @override
  State<ReadListView> createState() => _ReadListViewState();
}

class _ReadListViewState extends State<ReadListView> {
  final _userStream =
      FirebaseFirestore.instance.collection("Pothole").snapshots();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: StreamBuilder(
        stream: _userStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Connection Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading....');
          }
          var docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                // width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 2,
                    ),
                    // Circle
                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: custom_colors.accentOrange,
                                  boxShadow: [
                                    BoxShadow(
                                      color: custom_colors.backgroundBlack
                                          .withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 2),
                                    )
                                  ]),
                            ),
                            // Line
                            Expanded(
                              child: Container(
                                width: 4,
                                color: custom_colors.white,
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'There is a pothole at ${docs[index]['address']} \n at ${docs[index]['reportedDate'].toDate()} ',
                              style: TextStyle(
                                  fontSize: 12.5, color: custom_colors.white),
                            ),
                          ]),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
