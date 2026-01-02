import 'package:dio/dio.dart';
import '../../../../core/config/api_config.dart';

class DioService {
  late final Dio _dio;

  DioService(AppApiConfig config) {
    _dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: config.timeout,
        receiveTimeout: config.timeout,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          //здесь можно добавить token
          return handler.next(options);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  // ===== HTTP METHODS =====

  Future<Response<T>> get<T>(
      String path, {
        Map<String, dynamic>? query,
      }) {
    return _dio.get<T>(path, queryParameters: query);
  }

  Future<Response<T>> post<T>(
      String path, {
        dynamic data,
      }) {
    return _dio.post<T>(path, data: data);
  }

  Future<Response<T>> put<T>(
      String path, {
        dynamic data,
      }) {
    return _dio.put<T>(path, data: data);
  }

  Future<Response<T>> delete<T>(
      String path, {
        dynamic data,
      }) {
    return _dio.delete<T>(path, data: data);
  }
}
