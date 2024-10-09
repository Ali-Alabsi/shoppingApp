

import 'package:dio/dio.dart';

import '../../main.dart';
import 'end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    options.headers[ApiKey.token] =
         sharedPreferences!.getString(ApiKey.id) != null
            ? '${sharedPreferences!.getString(ApiKey.token)}'
            : null;
    super.onRequest(options, handler);
  }
}
