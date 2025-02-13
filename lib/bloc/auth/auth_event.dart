part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}


final class PostLogin extends AuthEvent {
  final String email;
  final String password;

  const PostLogin({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
  
}


final class PostRegister extends AuthEvent {

  final RegisterForm form;

  const PostRegister({required this.form});

  @override
  List<Object?> get props => [form];

}