
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Network {

  static Dio networkDio() {
    String baseUrl = dotenv.env['BASE_URL'] ?? "";
    final options = BaseOptions(
      baseUrl: baseUrl,
    );
    return Dio(options);
  }
}