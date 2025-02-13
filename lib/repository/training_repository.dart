
import 'package:cimb_growthhub_app/model/response/response.dart';
import 'package:cimb_growthhub_app/model/response/traning.dart';
import 'package:cimb_growthhub_app/util/network.dart';
import 'package:dio/dio.dart';

abstract class TrainingRepository {
  Future<List<TrainingData>> getTraining();                 

  Future<TrainingData> getTrainingById(String id);                 

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


}