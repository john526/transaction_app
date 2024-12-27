import 'package:dio/dio.dart';
import 'package:transaction_app/app/common/app_helpers.common.dart';

class CustomerInterceptor extends Interceptor {
  final bool requireCustomerId;

  CustomerInterceptor({required this.requireCustomerId});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (requireCustomerId) {
      final customerEncoding = AppHelpersCommon.getCustomerInLocalStorage();
      if (customerEncoding != null) {
        final String customerId = customerEncoding.id;
        if (customerId.isNotEmpty) {
          options.headers.addAll({'customerId': customerId});
        }
      }
    }
    handler.next(options);
  }
}
