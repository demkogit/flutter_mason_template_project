import 'package:{{app_name}}/utils/constants/static_data.dart';
import 'package:dio/dio.dart';

class RequestHandler {
  static final RequestHandler _singleton = RequestHandler._init();

  Dio? _dio;

  RequestHandler._init() {
    _dio = _createDio();
  }

  factory RequestHandler() {
    final handler = _singleton;

    return handler;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    String? baseUrl,
  }) async {
    late Response<T> res;

    _dio?.options = _dio!.options.copyWith(
      baseUrl: baseUrl ?? StaticData.apiUrl,
    );

    res = await _dio!.get(
      path,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
    );

    return res;
  }

  Dio _createDio() {
    return Dio(
      BaseOptions(
        baseUrl: StaticData.apiUrl,
        connectTimeout: 20000,
        receiveTimeout: 40000,
      ),
    );
  }
}
