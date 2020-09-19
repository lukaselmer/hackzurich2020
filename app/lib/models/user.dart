class User {
  String id;
  String uid;
  String name;
  String email;
  String username;
  String status;
  int state;
  String profilePhoto;

  User({
    this.id,
    this.uid,
    this.name,
    this.email,
    this.username,
    this.status,
    this.state,
    this.profilePhoto,
  });

  Map<String, dynamic> toMap(User user) {
    return <String, dynamic>{
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

  User.fromMap(Map<String, dynamic> mapData) {
    this.id = mapData['id'] as String;
    this.uid = mapData['uid'] as String;
    this.name = mapData['name'] as String;
    this.email = mapData['email'] as String;
    this.username = mapData['username'] as String;
    this.status = mapData['status'] as String;
    this.state = mapData['state'] as int;
    this.profilePhoto = mapData['profile_photo'] as String;
  }
}
