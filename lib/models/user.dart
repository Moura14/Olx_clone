enum UserType { PARTICULAR, PROFISSIONAL }

class User {
  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.userType,
      this.createdAt});

  String id;
  String name;
  String email;
  String phone;
  String password;
  UserType userType = UserType.PARTICULAR;
  DateTime createdAt;

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, password: $password, type: $userType, createdAt: $createdAt}';
  }
}
