 import 'package:flutter/material.dart';
import 'package:transaction_app/app/services/api-result.service.dart';
import 'package:transaction_app/app/services/http-transactions.service.dart';
import 'package:transaction_app/app/services/network_exceptions.service.dart';
import 'package:transaction_app/domaine/entities/customer.entity.dart';
import 'package:transaction_app/domaine/entities/sign-up-data.entity.dart';

class CoreRepository {
  HttpTransactionService server = HttpTransactionService();

  Future<ApiResultService<CustomerEntity>> signUp(
      {required String phone,
      required String password,
      required String username}) async {
    try {
      final client =
          server.client(requireAuth: false, requireCustomerId: false);
      final data = SignUpDataEntity(
          phone: phone, password: password, username: username);
      final response = await client.post(
        "customers",
        data: data,
      );
      return ApiResultService.success(
        data: CustomerEntity.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('=================> signUp failure: $e');
      return ApiResultService.failure(
          error: NetworkExceptionsService.getDioException(e),
          statusCode: NetworkExceptionsService.getDioStatus(e));
    }
  }

  Future<ApiResultService<CustomerEntity>> getCustomer(
      String customerId) async {
    try {
      final client =
          server.client(requireAuth: true, requireCustomerId: true);

      final response = await client.get("customers/$customerId");

      return ApiResultService.success(
        data: CustomerEntity.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('=================> getCustomer failure: $e');
      return ApiResultService.failure(
          error: NetworkExceptionsService.getDioException(e),
          statusCode: NetworkExceptionsService.getDioStatus(e));
    }
  }


  Future<ApiResultService<CustomerEntity>> patchCustomer(
      dynamic data, String id) async {
    try {
      final client = server.client(requireAuth: true, requireCustomerId: true);
      final response = await client.put("customers/$id", data: data);
      return ApiResultService.success(
        data: CustomerEntity.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('=================> patchCustomer failure: $e');
      return ApiResultService.failure(
          error: NetworkExceptionsService.getDioException(e),
          statusCode: NetworkExceptionsService.getDioStatus(e));
    }
  }
}