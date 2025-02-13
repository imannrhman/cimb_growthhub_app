import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cimb_growthhub_app/model/request/register.dart';
import 'package:cimb_growthhub_app/model/response/error.dart';
import 'package:cimb_growthhub_app/model/response/login.dart';
import 'package:cimb_growthhub_app/model/response/user_profile.dart';
import 'package:cimb_growthhub_app/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<PostLogin>(_postLogin);   
    on<PostRegister>(_postRegister);    
  }


  Future<void> _postLogin(PostLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      LoginResponse response = await authRepository.login(email: event.email, password: event.password);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("token", response.token);
      print("test");
      UserProfile userProfile =  await authRepository.getUserByToken(response.token);

      if (userProfile.role.name != "admin" || userProfile.role.name != "hr") {
          sharedPreferences.setString("profile", jsonEncode(userProfile.toJson()));
          emit(AuthLoginSuccess(login: response));
      } else {
        emit(AuthLoginError(error: "Anda tidak memiliki akses"));
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.data["message"] is String) {
          emit(AuthLoginError(error: e.response?.data["message"]));
        } else {
          emit(AuthLoginError(error: "Terjadi kesalahan" ));
        }
        
      } else {
        emit(AuthLoginError(error: e.toString()));
      }
    }
  }

  Future<void> _postRegister(PostRegister event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.register(register: event.form);
      emit(AuthRegisterSuccess());
    } catch (e) {
      emit(AuthRegisterError(message: "Terjadi Kesalahan"));
    }
  }


}


