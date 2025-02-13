// To parse this JSON data, do
//
//     final errorData = errorDataFromJson(jsonString);

import 'dart:convert';

ErrorData errorDataFromJson(String str) => ErrorData.fromJson(json.decode(str));

String errorDataToJson(ErrorData data) => json.encode(data.toJson());

class ErrorData {
    bool success;
    String message;

    ErrorData({
        required this.success,
        required this.message,
    });

    factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}
