import 'package:flutter/material.dart';
import 'package:transaction_app/app/services/api-result.service.dart';
import 'package:transaction_app/app/services/http-transactions.service.dart';
import 'package:transaction_app/app/services/network_exceptions.service.dart';
import 'package:transaction_app/domaine/entities/operator.entity.dart';

class OperatorRepository {
  HttpTransactionService server = HttpTransactionService();

    Future<ApiResultService<List<OperatorEntity>>> getOperators(String id) async {
    try {
      final client = server.client(requireAuth: true, requireCustomerId: true);

      final response = await client.get("operators");

      final List<dynamic> data = response.data;
      final List<OperatorEntity> operators =
          data.map((item) => OperatorEntity.fromJson(item)).toList();

      return ApiResultService.success(
        data: operators,
      );
    } catch (e) {
      debugPrint('===============> Get operators failure: $e');
      return ApiResultService.failure(
        error: NetworkExceptionsService.getDioException(e),
        statusCode: NetworkExceptionsService.getDioStatus(e),
      );
    }
  }
}