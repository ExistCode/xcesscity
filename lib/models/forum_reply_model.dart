class ForumReplyModel {
  String id;
  String userName;
  String authorName;
  String userProfileUrl;
  bool isLiked;

  ForumReplyModel({
    required this.id,
    required this.userName,
    required this.authorName,
    required this.userProfileUrl,
    required this.isLiked,
  });
}
