enum UserType { PARTICULAR, PROFISSIONAL }

class User {
  User(this.name, this.email, this.phone, this.password);

  String name;
  String email;
  String phone;
  String password;
  UserType userType = UserType.PARTICULAR;
}
