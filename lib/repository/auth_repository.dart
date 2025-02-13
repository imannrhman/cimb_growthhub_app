import 'package:cimb_growthhub_app/model/response/login.dart';
import 'package:cimb_growthhub_app/model/response/response.dart';
import 'package:cimb_growthhub_app/ui/login/login_screen.dart';
import 'package:cimb_growthhub_app/util/network.dart';
import 'package:dio/dio.dart';

abstract class AuthRepository {
  Future<LoginResponse> login({required String email, required String password});                 
  register();
}

class AuthRepositoryAPI implements AuthRepository {

  final Dio request = Network.networkDio();

  @override
  Future<LoginResponse> login({required String email, required String password}) async {
      Response response =  await request.post('/login', data: {
        'email': email,
        'password': password
      });

      ResponseData data = responseFromJson(response.data);
      return LoginResponse.fromJson(data.data);
  }

  @override
  register() {
    // TODO: implement register
    throw UnimplementedError();
  }

}