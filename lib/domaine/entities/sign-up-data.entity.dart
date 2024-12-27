class SignUpDataEntity {
  final String? phone;
  final String? password;
  final String? username;

  SignUpDataEntity({
    required this.phone,
    required this.password,
    required this.username
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['password'] = password;
     map['username'] = username;
    return map;
  }
}
