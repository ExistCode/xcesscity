import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcesscity/screens/forum_screen.dart';
import 'package:xcesscity/widgets/create_new_forum_category.dart';

import '../models/colors.dart';
import '../models/forum_model.dart';
import '../models/user_model.dart';
import '../providers/forum_provider.dart';
import '../providers/user_provider.dart';

class CreateNewForum extends StatefulWidget {
  const CreateNewForum({super.key});
  static const routeName = '/createNewForum';
  @override
  State<CreateNewForum> createState() => _CreateNewForumState();
}


class _CreateNewForumState extends State<CreateNewForum> {
  TextEditingController postController = TextEditingController();

    

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<ForumProvider>(context, listen: false);
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    ForumModel _loadedForum = ForumModel(
          id: "",
          authorName: currentUser.name,
          userName: currentUser.userName,          
          content: postController.text,
          numOfLikes: 0,
          numOfShares: 0,
          numOfReplies: 0,
          userProfileUrl: "",
          imageUrl: "",
        );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 20,
                  left: 10,
                  right: 10,
                  bottom: 10),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF372637),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => {Navigator.of(context).pop()},
                    child: Icon(Icons.keyboard_arrow_left_rounded,
                        size: 32, color: white),
                  ),
                  Text(
                    "Create Post",
                    style: TextStyle(
                        color: white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: 65,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: accentOrange),
                      child: Center(
                          child: Text('Post',
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.bold))))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, ),
                        child:Icon(Icons.account_circle_rounded,color:Colors.grey,size:60)
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentUser.name,
                        style: TextStyle(color: white),
                      ),
                      Text(
                        "@${currentUser.userName}",
                        style: TextStyle(color: white.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: postController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                  hintStyle: TextStyle(color: white.withOpacity(0.5)),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 200),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: accentOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CreateNewForumCategory(Icons.photo, "Photos and Videos"),
                      CreateNewForumCategory(
                          Icons.pin_drop_rounded, "Location"),
                      CreateNewForumCategory(Icons.tag, "Tagging"),
                      CreateNewForumCategory(
                          Icons.diversity_1_rounded, "Community"),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                             _provider.loadedForumList.add(_loadedForum);

                             Navigator.of(context).pop();
                          });           
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 225,
                          height: 55,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: black.withOpacity(0.7),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                          ),
                          child: Text("Post",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: accentOrange)),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
