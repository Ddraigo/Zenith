

import 'dart:io';
import 'package:app_demo/src/shared/http/interceptor/dio_connectivity_request_retrier.dart';
import 'package:dio/dio.dart';

class RetryInterceptorChangedInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  RetryInterceptorChangedInterceptor({
    required this.requestRetrier
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
   if(_shouldRetry(err)){
    try {
      requestRetrier.scheduleRequestRetry(err.requestOptions);
    } catch (e) {
      throw FormatException('');
    }
   }
  }

  bool _shouldRetry(DioException err){
    return err.type == DioExceptionType.connectionTimeout &&
      err.error != null &&
      err.error is SocketException;
  }
}