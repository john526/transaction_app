import 'package:dio/dio.dart';
import 'package:transaction_app/app/config/constants/auth.constant.dart';
import 'package:transaction_app/app/services/local-storage.service.dart';

class TokenInterceptor extends Interceptor {
  final bool requireAuth;

  TokenInterceptor({required this.requireAuth});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String token =
        LocalStorageService.instance.get(AuthConstant.keyToken) ?? "";
    if (token.isNotEmpty && requireAuth) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    handler.next(options);
  }
}
