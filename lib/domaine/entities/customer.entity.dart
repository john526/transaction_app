class CustomerEntity {
  final String id;
  final String? firstname;
  final String? lastname;
  final String username;
  final String? password;
  final String phone;
  final String? email;
  final String? country;
  final String? city;
  final bool? lock;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int? fullQuantityAllowedPerOder;

  CustomerEntity({
    required this.id,
    this.firstname,
    this.lastname,
    required this.username,
    required this.password,
    required this.phone,
    this.email,
    this.country,
    this.city,
    this.lock = false,
    this.fullQuantityAllowedPerOder,
    required this.createdAt,
    this.updatedAt,
  });

  factory CustomerEntity.fromJson(Map<String, dynamic> json) {
    return CustomerEntity(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      username: json['username'],
      password: json['password'],
      phone: json['phone'],
     /* bonusCodes: (json['bonusCodes'] as List)
          .map((code) => BonusCodeEntity.fromJson(code))
          .toList(),*/
      email: json['email'],
      country: json['country'],
      city: json['city'],
      lock: json['lock'],
      fullQuantityAllowedPerOder: json['fullQuantityAllowedPerOder'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'password': password,
      'phone': phone,
      'email': email,
      'country': country,
      'city': city,
      'lock': lock,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
