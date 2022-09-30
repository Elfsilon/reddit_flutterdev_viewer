import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_flutterdev_viewer/network/config.dart';

final dioClientProvider = Provider((ref) => DioClient());

class DioClient {
  DioClient() : _dio = Dio(BaseOptions(
    baseUrl: Endpoints.baseUrl,
    receiveTimeout: ClientConfig.receiveTimeout,
    connectTimeout: ClientConfig.connectionTimeout,
    responseType: ResponseType.json,
  ));

  final Dio _dio;

  Future<Response> get(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } on DioError catch (err) {
      throw err.message;
    }
  }
}