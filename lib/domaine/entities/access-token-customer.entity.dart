class AccessTokenCustomer {
  final String id;
  final String? token;
  final String? customerId;
  final DateTime createdAt;
  final DateTime? updatedAt;

  AccessTokenCustomer({
    required this.id,
    this.token,
    this.customerId,
    required this.createdAt,
    this.updatedAt,
  });

  factory AccessTokenCustomer.fromJson(Map<String, dynamic> json) {
    return AccessTokenCustomer(
      id: json['id'],
      token: json['token'],
      customerId: json['customerId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'customerId': customerId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
