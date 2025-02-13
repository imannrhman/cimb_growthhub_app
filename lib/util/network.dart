
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Network {

  static Dio networkDio() {
    String baseUrl = dotenv.env['BASE_URL'] ?? "";
    print(baseUrl);
    final options = BaseOptions(
      baseUrl: baseUrl,
    );
    return Dio(options);
  }
}