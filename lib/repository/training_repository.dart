
import 'package:cimb_growthhub_app/model/response/enroll.dart';
import 'package:cimb_growthhub_app/model/response/response.dart';
import 'package:cimb_growthhub_app/model/response/traning.dart';
import 'package:cimb_growthhub_app/util/network.dart';
import 'package:dio/dio.dart';

abstract class TrainingRepository {
  Future<List<TrainingData>> getTraining();                 

  Future<TrainingData> getTrainingById(String id);

  Future<List<Enrollment>> getEnrolledTraining(String token);

  Future<Enrollment> getEnrolledTrainingDetail(String token, String enrollId, String trainingId);

  Future<EnrollmentData> enrollTraining(String token, String id);

  Future<String> cancelTraining(String token, String id);
}

class TrainingRepositoryAPI implements TrainingRepository {

  final Dio request = Network.networkDio();
  
  @override
  Future<List<TrainingData>> getTraining() async {
    Response data = await request.get("/trainings");
    List<TrainingData> list = (ResponseData.fromJson(data.data).data as List).map((value) => TrainingData.fromJson(value)
    ).toList();
    return list;
  }
  
  @override
  Future<TrainingData> getTrainingById(String id) async{
    Response data = await request.get("/trainings/$id");
    return TrainingData.fromJson(ResponseData.fromJson(data.data).data);
  }

  @override
  Future<EnrollmentData> enrollTraining(String token, String id) async {
    Response data = await request.post("/trainings/enroll",
      data: {
        "training_id": id,
      },
        options: Options(
          headers: {
            "Authorization" : "Bearer $token"
          },)
    );

    return EnrollmentData.fromJson(ResponseData.fromJson(data.data).data);
  }

  @override
  Future<String> cancelTraining(String token, String id) async {
    Response data = await request.post("/trainings/cancel-enrollment",
        data: {
          "training_id": id,
        },
        options: Options(
          headers: {
            "Authorization" : "Bearer $token"
          },)
    );
    return data.data["message"];
  }

  @override
  Future<List<Enrollment>> getEnrolledTraining(String token) async {
    Response data = await request.get("/trainings/enrolled",
        options: Options(
          headers: {
            "Authorization" : "Bearer $token"
          },)
    );

    List<Enrollment> list = (ResponseData.fromJson(data.data).data as List).map((value) => Enrollment.fromJson(value)
    ).toList();
    return list;
    throw UnimplementedError();
  }

  @override
  Future<Enrollment> getEnrolledTrainingDetail(String token, String enrollId, String trainingId) async {
    Response data = await request.get("/trainings/$trainingId/requests/$enrollId",
        options: Options(
          headers: {
            "Authorization" : "Bearer $token"
          },)
    );
    return Enrollment.fromJson(ResponseData.fromJson(data.data).data);
  }




}