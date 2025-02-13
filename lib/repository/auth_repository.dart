import 'package:cimb_growthhub_app/util/network.dart';
import 'package:dio/dio.dart';

abstract class AuthRepository {
  login();
  register();
}

class AuthRepositoryAPI implements AuthRepository {

  final Dio request = Network.networkDio();

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  register() {
    // TODO: implement register
    throw UnimplementedError();
  }

}