class Shakti {
  String? role;
  String? username;
  String? email;
  String? password;
  String? firebaseToken;

  Shakti(
      {this.role,
      this.username,
      this.email,
      this.password,
      this.firebaseToken});

  Shakti.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    firebaseToken = json['firebaseToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['firebaseToken'] = this.firebaseToken;
    return data;
  }
}
