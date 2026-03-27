

import 'dart:io';

import 'package:app_demo/src/features/authentication/application/token_service.dart';
import 'package:app_demo/src/shared/http/api_response.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/interceptor/dio_connectivity_request_retrier.dart';
import 'package:app_demo/src/shared/http/interceptor/retry_interceptor.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum ContentType{ urlEncode, json}

final apiProvider = Provider<ApiProvider>(ApiProvider.new);

class ApiProvider {
  ApiProvider(this._ref){
    _dio = Dio();
    _dio.options.sendTimeout = const Duration(seconds: 5);
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 5);
    _dio.interceptors.add(
      RetryInterceptorChangedInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(dio: _dio, connectivity: Connectivity()),
      )
    );

    if(kDebugMode){
      _dio.interceptors.add(PrettyDioLogger(requestBody: true));
    }

    // if(dotenv.evn['BASE_URL'] != null){
    //   _baseUrl = dotenv.env['BASE_URL']!;
    // }
  }

  final Ref _ref;
  late Dio _dio;

  late final TokenService _tokenService = _ref.read(tokenServiceProvider);

  late String _baseUrl;

  Future<APIResponse> post(
    String path,
    dynamic body, {
      String? newBaseUrl,
      String? token,
      Map<String, String?>? query,
      ContentType contentType = ContentType.json,
    }
  )async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none){
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if(newBaseUrl != null){
      url = newBaseUrl + path;
    }else{
      url = _baseUrl + path;
    }

    var content = 'application/x-www-form-urlencoded';
    
    if(contentType == ContentType.json){
      content = 'application/json';
    }

    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': content,
      };
      final _appToken = await _tokenService.fetchToken();
      if(_appToken != null){
        headers['Authorization'] = 'Bearer $_appToken';
      }
      if(token != null){
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await _dio.post(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status)=> true, headers: headers),
      );

      if(response.statusCode == null){
        return const APIResponse.error(AppException.connectivity());
      }

      if(response.statusCode! < 300){
        if(response.data['data'] != null){
          return APIResponse.success(response.data['data']);
        }else{
          return APIResponse.success(response.data);
        }
      }else{

        if(response.statusCode! == 401){
          return APIResponse.error(AppException.unauthorized());
        }else if(response.statusCode! == 502 ){
          return const APIResponse.error(AppException.unknown());
        }else{
          if(response.data['message'] != null){
            return APIResponse.error(AppException.errorWithMessage(
              response.data['message'] as String ?? ''
            ));
          }else{
            return const APIResponse.error(AppException.unknown());
          }
        }
      }
    } on DioException catch (e) {
      if( e.type == DioExceptionType.connectionError || 
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.sendTimeout){
        return const APIResponse.error(AppException.connectivity());
      }

      if(e.response != null){
        if(e.response!.data['message'] != null){
          return APIResponse.error(AppException.errorWithMessage(
            e.response!.data['message'] as String
          ));
        }
        
      }
      return APIResponse.error(AppException.errorWithMessage(
          e.message ?? ''
      ));

    } on Error catch (e){
      return APIResponse.error(
        AppException.errorWithMessage(e.stackTrace.toString())
      );
    }
  }

  Future<APIResponse> get(
    String path, {
      String? newBaseUrl,
      String? token,
      Map<String, dynamic>? query,
      ContentType contentType = ContentType.json,
    }
  )async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none){
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if(newBaseUrl != null){
      url = newBaseUrl + path;
    }else{
      url = _baseUrl + path;
    }

    var content = 'application/x-www-form-urlencoded';

    if(contentType == ContentType.json){
      content = 'application/json; charset=utf-8';
    }

    final headers = {
      'accept': '*/*',
      'Content-Type': content,
    };

    final _appToken = await _tokenService.fetchToken();
    if(_appToken != null){
      headers['Authorization'] = 'Bearer $_appToken';
    }

    try {
      final response = await _dio.get(
        url, 
        queryParameters: query,
        options: Options(validateStatus: (status)=> true, headers:  headers),
      );
      if(response == null){
        return const APIResponse.error(AppException.unknown());
      }
      if(response.statusCode == null){
        return const APIResponse.error(AppException.connectivity());
      }

      if(response.statusCode! < 300){
        return APIResponse.success(response.data['data']);
      }else{
        if(response.statusCode! == 404){
          return const APIResponse.error(AppException.connectivity());
        }else if(response.statusCode! == 401){
          return const APIResponse.error(AppException.unauthorized());
        }else if(response.statusCode! == 502){
          return const APIResponse.error(AppException.unknown());
        }else{
          if(response.data['error'] != null){
            return APIResponse.error(AppException.errorWithMessage(
              response.data['error'] as String ?? ''
            ));
          }else{
            return const APIResponse.error(AppException.unknown());
          }
        }
      }
    } on DioException catch (e) {
      if(e.error is SocketException){
        return const APIResponse.error(AppException.connectivity());
      }
      if(e.type == DioExceptionType .connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.sendTimeout){
        return const APIResponse.error(AppException.connectivity());
      }
      return const APIResponse.error(AppException.unknown());
    }

  }

}