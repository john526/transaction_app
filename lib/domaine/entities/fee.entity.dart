import 'package:transaction_app/domaine/entities/operator.entity.dart';

class FeeEntity {
  final String id;
  final double? percent;
  final List<OperatorEntity>? operators;
  final DateTime createdAt;
  final DateTime? updatedAt;

  FeeEntity({
    required this.id,
    this.percent,
    this.operators,
    required this.createdAt,
    this.updatedAt,
  });

  factory FeeEntity.fromJson(Map<String, dynamic> json) {
    return FeeEntity(
      id: json['id'],
      percent: json['percent'],
     operators: (json['operators'] as List)
          .map((code) => OperatorEntity.fromJson(code))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'percent': percent,
      'operators': operators!=null ? operators!.map((code) => code.toJson()).toList() : [],
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
