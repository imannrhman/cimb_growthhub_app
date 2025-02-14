import 'dart:convert';

import 'package:cimb_growthhub_app/model/response/traning.dart';

EnrollmentData enrollmentDataFromJson(String str) => EnrollmentData.fromJson(json.decode(str));

String enrollmentDataToJson(EnrollmentData data) => json.encode(data.toJson());

class EnrollmentData {
  Enrollment enrollment;

  EnrollmentData({
    required this.enrollment,
  });

  factory EnrollmentData.fromJson(Map<String, dynamic> json) => EnrollmentData(
    enrollment: Enrollment.fromJson(json["enrollment"]),
  );

  Map<String, dynamic> toJson() => {
    "enrollment": enrollment.toJson(),
  };
}

class Enrollment {
  String userId;
  String trainingId;
  String status;
  DateTime tglDaftar;
  String id;
  DateTime updatedAt;
  DateTime createdAt;
  TrainingData? training;

  Enrollment({
    required this.userId,
    required this.trainingId,
    required this.status,
    required this.tglDaftar,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    this.training,
  });

  factory Enrollment.fromJson(Map<String, dynamic> json) => Enrollment(
    userId: json["user_id"],
    trainingId: json["training_id"],
    status: json["status"],
    tglDaftar: DateTime.parse(json["tgl_daftar"]),
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    training: json['training'] != null ? TrainingData.fromJson(json["training"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "training_id": trainingId,
    "status": status,
    "tgl_daftar": tglDaftar.toIso8601String(),
    "id": id,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "training": training?.toJson(),
  };
}
