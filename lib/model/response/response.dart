import 'dart:convert';

ResponseData responseFromJson(String str) => ResponseData.fromJson(json.decode(str));

String responseToJson(ResponseData data) => json.encode(data.toJson());

class ResponseData{
    bool success;
    String message;
    Map<String, dynamic> data;

    ResponseData({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        success: json["success"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
    };
}