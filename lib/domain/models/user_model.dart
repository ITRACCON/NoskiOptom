class User {
  int idTg;
  String username;
  String userFL;
  User({required this.idTg, required this.username, required this.userFL});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        idTg: int.parse(json['tgId']),
        username: json['tgLogin'],
        userFL: json['userFL']);
  }
}
