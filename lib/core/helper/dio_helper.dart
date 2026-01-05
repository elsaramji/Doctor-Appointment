import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'token_storage.dart';

@Singleton()
class DioHelper {
  final Dio _dio;
  final TokenStorage _tokenStorage = TokenStorage();

  DioHelper()
      : _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    ),
  ) {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
      compact: true,
    ));
  }

  // =================== Merge headers dynamically ===================
  Future<Options> _mergeHeaders([Map<String, String>? headers]) async {
    final accessToken = await _tokenStorage.getAccessToken();

    final defaultHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (accessToken != null) 'Authorization': 'Bearer $accessToken',
    };

    if (headers != null) {
      defaultHeaders.addAll(headers);
    }

    return Options(headers: defaultHeaders);
  }

  // =================== GET ===================
  Future<Response?> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
  }) async {
    try {
      final options = await _mergeHeaders(headers);
      return await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      log('GET Error: ${e.message}');
      return e.response;
    }
  }

  // =================== POST ===================
  Future<Response?> postRequest(
    String endpoint,
    dynamic data, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final options = await _mergeHeaders(headers);
      return await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      log('POST Error: ${e.message}');
      return e.response;
    }
  }

  // =================== PUT ===================
  Future<Response?> putRequest(
    String endpoint,
    dynamic data, {
    Map<String, String>? headers,
  }) async {
    try {
      final options = await _mergeHeaders(headers);
      return await _dio.put(
        endpoint,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      log('PUT Error: ${e.message}');
      return e.response;
    }
  }

  // =================== PATCH ===================
  Future<Response?> patchRequest(
      String endpoint,
      dynamic data, {
        Map<String, String>? headers,
      }) async {
    try {
      final options = await _mergeHeaders(headers);
      return await _dio.patch(
        endpoint,
        data: data,
        options: options,
      );
    } on DioException catch (e) {
      log('PATCH Error: ${e.message}');
      return e.response;
    }
  }

  // =================== DELETE ===================
  Future<Response?> deleteRequest(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final options = await _mergeHeaders(headers);
      return await _dio.delete(
        endpoint,
        options: options,
      );
    } on DioException catch (e) {
      log('DELETE Error: ${e.message}');
      return e.response;
    }
  }

  // =================== Logout ===================
  Future<Response?> logout() async {
    return await postRequest(
      '/api/Identity/Accounts/logout',
      {},
    );
  }

  // =================== Check Connectivity ===================
  Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.vpn ||
        connectivityResult == ConnectivityResult.ethernet;
  }
}
