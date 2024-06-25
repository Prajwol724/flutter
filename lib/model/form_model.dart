class Student {
  String? id;
  String? fname;
  String? lname;
  int? age;
  String? faculty;
  String? gender;
  String? email;
  String? password;

  Student(
      {this.fname,
      this.id,
      this.lname,
      this.age,
      this.faculty,
      this.gender,
      this.email,
      this.password});

  Student.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
    age = json['age'];
    faculty = json['faculty'];
    gender = json['gender'];
    email = json['email'];
    password = json['password'];
    id=json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['age'] = this.age;
    data['faculty'] = this.faculty;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['password'] = this.password;
    data['id']=this.id;
    return data;
  }
}
