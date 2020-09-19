class User {
  final String id;
  final String uid;
  final String name;
  final String email;
  final String username;
  final String status;
  final String profilePhoto;
  final String flag;

  int state;

  User({
    this.id,
    this.uid,
    this.name,
    this.email,
    this.username,
    this.status,
    this.state,
    this.profilePhoto,
    this.flag,
  });

  Map<String, dynamic> toMap(User user) => <String, dynamic>{
        'id': user.id,
        'uid': user.uid,
        'name': user.name,
        'email': user.email,
        'username': user.username,
        'status': user.status,
        'state': user.state,
        'profile_photo': user.profilePhoto,
      };
}
