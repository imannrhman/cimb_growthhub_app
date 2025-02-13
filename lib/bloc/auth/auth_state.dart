part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoginSuccess extends AuthState {
  final LoginResponse login;

  const AuthLoginSuccess({
    required this.login,
  });

  @override
  List<Object> get props => [login]; 
}


final class AuthLoginError extends AuthState {
  final String error;

  const AuthLoginError({required this.error});

  @override
  List<Object> get props => [error]; 
}


final class AuthRegisterSuccess extends AuthState {
  final LoginResponse login;

  const AuthRegisterSuccess({
    required this.login,
  });

  @override
  List<Object> get props => [login]; 
}

final class AuthRegisterError extends AuthState{
  final String message;

  const AuthRegisterError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}