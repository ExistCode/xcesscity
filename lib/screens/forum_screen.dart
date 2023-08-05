import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcesscity/models/colors.dart';
import 'package:xcesscity/screens/create_new_forum.dart';
import 'package:xcesscity/screens/loading_screen.dart';
import 'package:xcesscity/widgets/forum_top_bar.dart';

import '../providers/forum_provider.dart';
import '../widgets/forum_post.dart';

class ForumScreen extends StatefulWidget {
  static const routeName = '/forum';
  @override
  State<ForumScreen> createState() => _ForumScreenState();

  
}

class _ForumScreenState extends State<ForumScreen> {
  
  bool _isLoading = true;
  @override
   void initState() {
    // TODO: implement initState
    var _provider = Provider.of<ForumProvider>(context, listen: false);
    if (_provider.forumIdList.isEmpty) {
      _provider.fetchForumId().then(
        (_) {
          print('Successfuly fetched ${_provider.forumIdList.length} ids');
          _provider.fetchAllForumData().then(
            (_) {
              setState(
                () {
                  _isLoading = false;
                },
              );
            },
          );
        },
      );
    } else {
      setState(
        () {
          _isLoading = false;
        },
      );
    }

    super.initState();
  }
  Widget build(BuildContext context) {
    var _provider = Provider.of<ForumProvider>(context, listen: false);
    return Scaffold(
      body: _isLoading==true? LoadingScreen(): Container(
          width: double.infinity,
          child: Stack(children: [
            SingleChildScrollView(

              child: Column(
                children: [
                  ForumTopBar(),
                  Container(
                    padding:EdgeInsets.only(top: 20,left:20,right:20),
                          width: double.infinity,
                          height: _provider.forumIdList.length * 200 +
                              _provider.forumIdList.length * 50,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _provider.forumIdList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ForumPost(
                                     _provider
                                        .loadedForumList[index].authorName,
                                    _provider.loadedForumList[index].userName,
                                    _provider.loadedForumList[index].content,      
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 25,
              child: GestureDetector(
                  onTap: () =>
                      {Navigator.of(context).pushNamed(CreateNewForum.routeName)},
                  child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: accentOrange),
                      child: Icon(Icons.add, color: white))),
            )
          ]),
        ),
      );
  }
}
