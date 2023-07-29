class ForumModel {
  String id;
  String authorName;
  String userName;
  String content;
  int numOfLikes;
  int numOfReplies;
  int numOfShares;
  String userProfileUrl;

  ForumModel(
      {required this.id,
      required this.authorName,
      required this.userName,
      required this.content,
      required this.numOfLikes,
      required this.numOfReplies,
      required this.numOfShares,
      required this.userProfileUrl});
}
