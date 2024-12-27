import 'package:flutter/material.dart';
import 'package:transaction_app/app/services/api-result.service.dart';
import 'package:transaction_app/app/services/http-transactions.service.dart';
import 'package:transaction_app/app/services/network_exceptions.service.dart';
import 'package:transaction_app/domaine/entities/access-token-customer.entity.dart';
import 'package:transaction_app/domaine/entities/login-reponse.entity.dart';
import 'package:transaction_app/domaine/entities/login.entity.dart';

class AuthRepository {
  HttpTransactionService server = HttpTransactionService();

  //
  Future<ApiResultService<LoginResponseEntity>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final client =
          server.client(requireAuth: false, requireCustomerId: false);
      final data = LoginEntity(phone: phone, password: password);
      final response = await client.post(
        "auth-customer/login",
        data: data,
      );
      return ApiResultService.success(
        data: LoginResponseEntity.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('=================> login failure: $e');
      return ApiResultService.failure(
          error: NetworkExceptionsService.getDioException(e),
          statusCode: NetworkExceptionsService.getDioStatus(e));
    }
  }

  Future<ApiResultService<AccessTokenCustomer>> getCustomerAccessToken(String customerId) async {
    try {
      final client =
          server.client(requireAuth: false, requireCustomerId: true);
      final response = await client.get(
        "access-token-customer/customer/$customerId",
      );
      return ApiResultService.success(
        data: AccessTokenCustomer.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('=================> getCustomerAccessToken failure: $e');
      return ApiResultService.failure(
          error: NetworkExceptionsService.getDioException(e),
          statusCode: NetworkExceptionsService.getDioStatus(e));
    }
  }

  Future<ApiResultService<bool>> logout(String id) async {
    try {
      final client = server.client(requireAuth: true, requireCustomerId: true);
      final response = await client.put(
        "access-token-customer/logout/$id"
      );
      return ApiResultService.success(
        data: true,
      );
    } catch (e) {
      debugPrint('=================> logout failure: $e');
      return ApiResultService.failure(
          error: NetworkExceptionsService.getDioException(e),
          statusCode: NetworkExceptionsService.getDioStatus(e));
    }
  }

}