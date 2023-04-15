class UserModle {
  String? name;
  String? email;
  String? phone;
  // String? password;
  String? uId;

  UserModle({this.email, this.name, this.phone, this.uId}); //this.password

  UserModle.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    // password = json['password'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      // 'password': password,
      'uId': uId,
    };
  }
}
