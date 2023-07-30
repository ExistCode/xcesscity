class UserModel {
  String id;
  String name;
  String userName;
  String email;
  String gender;
  String age;
  dynamic userProfileUrl;
  dynamic userBackgroundUrl;

  UserModel(
      {required this.id,
      required this.name,
      required this.userName,
      required this.email,
      required this.gender,
      required this.age,
      required this.userProfileUrl,
      required this.userBackgroundUrl});
}
