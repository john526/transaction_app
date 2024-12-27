class LoginResponseEntity {
  final String token;
  final String customerId;

  LoginResponseEntity({required this.token, required this.customerId});

  LoginResponseEntity.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        customerId = json['customerId'];

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'customerId': customerId,
    };
  }
}

