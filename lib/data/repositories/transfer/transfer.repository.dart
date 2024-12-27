import 'package:flutter/material.dart';
import 'package:transaction_app/app/services/api-result.service.dart';
import 'package:transaction_app/app/services/http-transactions.service.dart';
import 'package:transaction_app/app/services/network_exceptions.service.dart';
import 'package:transaction_app/domaine/entities/operator.entity.dart';
import 'package:transaction_app/domaine/entities/transfer.entity.dart';

class TransactionRepository {
  HttpTransactionService server = HttpTransactionService();


  Future<ApiResultService<void>> makeOrder(CreateTransferEntity order) async {
  try {
    final client = server.client(requireAuth: true, requireCustomerId: true);

    final response = await client.post(
      "transfers", 
      data: order.toJson(),
      );
    final data = "successful";

    return ApiResultService.success(
      data:data,
    );
  } catch (e) {
    debugPrint('===============> Make a transaction failure: $e');
    return ApiResultService.failure(
      error: NetworkExceptionsService.getDioException(e),
      statusCode: NetworkExceptionsService.getDioStatus(e),
    );
  }
}

    Future<ApiResultService<List<TransferEntity>>> getTransfers(String id) async {
    try {
      final client = server.client(requireAuth: true, requireCustomerId: true);

      final response = await client.get("transfers");

      final List<dynamic> data = response.data;
      final List<TransferEntity> operators =
          data.map((item) => TransferEntity.fromJson(item)).toList();

      return ApiResultService.success(
        data: operators,
      );
    } catch (e) {
      debugPrint('===============> Get transfers failure: $e');
      return ApiResultService.failure(
        error: NetworkExceptionsService.getDioException(e),
        statusCode: NetworkExceptionsService.getDioStatus(e),
      );
    }
  }
}