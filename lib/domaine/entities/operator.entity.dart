class OperatorEntity {
  final String id;
  final String? name;
  final String? imageUrl;
  final bool? isAvailable;
  final String? feeId;
  final DateTime createdAt;
  final DateTime? updatedAt;

  OperatorEntity({
    required this.id,
    this.name,
    this.imageUrl,
    required this.isAvailable,
    required this.feeId,
    required this.createdAt,
    this.updatedAt,
  });

  factory OperatorEntity.fromJson(Map<String, dynamic> json) {
    return OperatorEntity(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      isAvailable: json['isAvailable'],
      feeId: json['password'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
      'feeId': feeId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
