import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'app_networks.dart';

class AppNetworkHelper {
  final Dio _dio;

  AppNetworkHelper(
    Dio dio,
  ) : _dio = dio {
    _dio.options.connectTimeout = const Duration(minutes: 2);
    _dio.options.sendTimeout = const Duration(minutes: 2);
    _dio.options.receiveTimeout = const Duration(minutes: 2);
    addDioHeaders();
    addDioInterceptors();
  }
  addDioHeaders() async {
    final headers = {
      'Authorization': 'Bearer ${AppNetworks.supabaseApiKey}',
      'apiKey': AppNetworks.supabaseApiKey,
      'Content-Type': 'application/json'
    };
    _dio.options.headers = headers;
  }

  addDioInterceptors() {
    _dio.interceptors.add(
      PrettyDioLogger(
        // compact: true,
        requestHeader: true,
        requestBody: true,
        // responseHeader: true,
        responseBody: true,
      ),
    );
  }

  Future<dynamic> post(
    Uri uri, {
    required String data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response<dynamic> response = await _dio.postUri(
        uri,
        data: data,
      );

      return response.data;
    } catch (error) {
      print("LockersNetworkHelper > post :: error");
    }

    return null;
  }

  Future<dynamic> put(Uri uri, [String? data]) async {
    try {
      Response<dynamic> response = await _dio.putUri(
        uri,
        data: data,
      );

      return response.data;
    } catch (error) {
      print("LockersNetworkHelper > put :: error");
    }

    return null;
  }

  Future<dynamic> patch(Uri uri, String? data) async {
    try {
      Response<dynamic> response = await _dio.patchUri(
        uri,
        data: data,
      );

      return response.data;
    } catch (error) {
      print("LockersNetworkHelper > put :: error");
    }

    return null;
  }

  Future<dynamic> get(Uri uri) async {
    try {
      Response<dynamic> response = await _dio.getUri(
        uri,
      );

      return response.data;
    } catch (error) {
      print("LockersNetworkHelper > get :: error");
    }

    return null;
  }

  Future<dynamic> delete(Uri uri) async {
    try {
      Response<dynamic> response = await _dio.deleteUri(
        uri,
      );

      return response.data;
    } catch (error) {
      print("LockersNetworkHelper > get :: error");
    }

    return null;
  }
}
