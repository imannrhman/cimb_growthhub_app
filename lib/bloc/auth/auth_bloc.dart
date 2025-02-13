import 'package:bloc/bloc.dart';
import 'package:cimb_growthhub_app/model/response/error.dart';
import 'package:cimb_growthhub_app/model/response/login.dart';
import 'package:cimb_growthhub_app/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<PostLogin>(_postLogin);    
  }


  Future<void> _postLogin(PostLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      LoginResponse response = await authRepository.login(email: event.email, password: event.password);
      print(response);
      emit(AuthLoginSuccess(login: response));
    } catch (e) {
      if (e is DioException) {
         ErrorData errorData = errorDataFromJson(e.response?.data ?? {});
 
         emit(AuthLoginError(error: errorData.message ));
      } else {
        emit(AuthLoginError(error: "Terjadi Kesala, Mohon coba kembali"));
      }
    }
  }
}


