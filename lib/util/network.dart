
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Network {
  static String baseUrl() {
    String baseUrl = dotenv.env['BASE_URL'] ?? "";
    return baseUrl;
  }
  static Dio networkDio() {
    String baseUrl = dotenv.env['BASE_URL'] ?? "";

    final options = BaseOptions(
      baseUrl: baseUrl,
      contentType: "application/json",
      headers: {
        "Accept" : "application/json",
        "Content-Type" : "application/json"
      }
    );
    return Dio(options);
  }
}