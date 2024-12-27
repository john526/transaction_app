import 'package:dio/dio.dart';
import 'package:transaction_app/app/config/env/environment.env.dart';
import 'package:transaction_app/app/interceptors/customer.interceptor.dart';
import 'package:transaction_app/app/interceptors/token.interceptor.dart';

class HttpTransactionService {
  Dio client({
    bool requireAuth = false,
    bool requireCustomerId = false,
  }) {
    final options = BaseOptions(
      baseUrl: Environment.backendPointTransactions,
     connectTimeout: const Duration(milliseconds: 60 * 1000),
      receiveTimeout:const  Duration(milliseconds: 60 * 1000),
      sendTimeout: const Duration(milliseconds: 60 * 1000),
      headers: {
        'Accept':
            'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8',
        'Content-type': 'application/json',
      },
    );

    final dio = Dio(options);

    dio.interceptors.add(TokenInterceptor(requireAuth: requireAuth));
    dio.interceptors.add(
      CustomerInterceptor(requireCustomerId: requireCustomerId),
    );
    
    dio.interceptors.add(
      LogInterceptor(
        responseHeader: false,
        requestHeader: true,
        responseBody: true,
        requestBody: true,
      ),
    );

    return dio;
  }
}