
import 'package:dio/dio.dart';


class Network {
  static Dio networkDio() {
    String baseUrl = "https://loose-rules-give-joyously.a276.dcdg.xyz/api";

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