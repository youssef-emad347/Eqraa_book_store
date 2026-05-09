class UsersModel {
  final String name;
  final String email;
  final String phone;

  UsersModel({required this.name, required this.phone, required this.email});

  // ToMap
  Map<String, dynamic> toJson() {
    return {'email': email, 'name': name, 'phone': phone};
  }
}
