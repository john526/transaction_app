class LoginEntity {
  final String? phone;
  final String? password;

  LoginEntity({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['password'] = password;
    return map;
  }
}
