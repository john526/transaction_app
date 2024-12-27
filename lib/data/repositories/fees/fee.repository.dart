import 'package:flutter/material.dart';
import 'package:transaction_app/app/services/api-result.service.dart';
import 'package:transaction_app/app/services/http-transactions.service.dart';
import 'package:transaction_app/app/services/network_exceptions.service.dart';
import 'package:transaction_app/domaine/entities/fee.entity.dart';

class FeeRepository {
  HttpTransactionService server = HttpTransactionService();

    Future<ApiResultService<List<FeeEntity>>> getFees(String id) async {
    try {
      final client = server.client(requireAuth: true, requireCustomerId: true);

      final response = await client.get("fees");

      final List<dynamic> data = response.data;
      final List<FeeEntity> fees =
          data.map((item) => FeeEntity.fromJson(item)).toList();

      return ApiResultService.success(
        data: fees,
      );
    } catch (e) {
      debugPrint('===============> Getfees failure: $e');
      return ApiResultService.failure(
        error: NetworkExceptionsService.getDioException(e),
        statusCode: NetworkExceptionsService.getDioStatus(e),
      );
    }
  }
}