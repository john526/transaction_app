class TransferEntity {
  final String id;
  final String? reference;
  final int? amount;
  final String? status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  TransferEntity({
    required this.id,
    this.reference,
    this.amount,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  factory TransferEntity.fromJson(Map<String, dynamic> json) {
    return TransferEntity(
      id: json['id'],
      reference: json['reference'],
      amount: json['amount'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'amount': amount,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class CreateTransferEntity {
  final String id;
  final String? reference;
  final int? amount;
  final String? status;

  CreateTransferEntity({
    required this.id,
    this.reference,
    this.amount,
    required this.status,
  });

  factory CreateTransferEntity.fromJson(Map<String, dynamic> json) {
    return CreateTransferEntity(
      id: json['id'],
      reference: json['reference'],
      amount: json['amount'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'amount': amount,
      'status': status,
    };
  }
}