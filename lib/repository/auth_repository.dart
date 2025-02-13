import 'dart:convert';

import 'package:cimb_growthhub_app/model/request/register.dart';
import 'package:cimb_growthhub_app/model/response/login.dart';
import 'package:cimb_growthhub_app/model/response/response.dart';
import 'package:cimb_growthhub_app/model/response/user_profile.dart';
import 'package:cimb_growthhub_app/ui/login/login_screen.dart';
import 'package:cimb_growthhub_app/util/network.dart';
import 'package:dio/dio.dart';

abstract class AuthRepository {
  Future<LoginResponse> login({required String email, required String password});                 
  Future<void> register({required RegisterForm register});
  Future<UserProfile> getUserByToken(String token);
}

class AuthRepositoryAPI implements AuthRepository {

  final Dio request = Network.networkDio();

  @override
  Future<LoginResponse> login({required String email, required String password}) async {
      
    print(email);
      Response response =  await request.post('/login', data: {
        "username" : email,
        "password" : password,
      });
      ResponseData data = ResponseData.fromJson(response.data);
      print("token");
      return LoginResponse.fromJson(data.data);
  }

  @override
  Future<void> register({required RegisterForm register}) async {
    await request.post('/register', data: register.toJson());
  }
  
  @override
  Future<UserProfile> getUserByToken(String token) async {
    Response response = await request.get("/user-by-token",
    options: Options(
      headers: {
        "Authorization" : "Bearer $token"
      },)
    );

    return UserProfile.fromJson(ResponseData.fromJson(response.data).data);
  }

}