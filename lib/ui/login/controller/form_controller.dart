import 'package:flutter/material.dart';

class FormController extends ChangeNotifier {
  bool _passwordVisible = true;
  bool get passwordVisible => _passwordVisible;

  bool _confirmPasswordVisible = true;
  bool get confirmPasswordVisible => _confirmPasswordVisible;

  TextEditingController _usernameTextEditingContoller = TextEditingController();
  TextEditingController get usernameTextEditingController => _usernameTextEditingContoller;

  TextEditingController _nameTextEditingContoller = TextEditingController();
  TextEditingController get nameTextEditingContoller => _nameTextEditingContoller; 


  TextEditingController _emailTextEditingContoller = TextEditingController();
  TextEditingController get emailTextEditingContoller => _emailTextEditingContoller; 

  DateTime _date = DateTime.now();
  DateTime get date => _date; 

  TextEditingController _jobTextEditingContoller = TextEditingController();
  TextEditingController get jobTextEditingContoller => _jobTextEditingContoller; 

  TextEditingController _officeTextEditingContoller = TextEditingController();
  TextEditingController get offficeTextEditingContoller => _officeTextEditingContoller; 

  TextEditingController _phoneTextEditingController = TextEditingController();
  TextEditingController get phoneTextEditingController => _phoneTextEditingController; 

TextEditingController _passwordTextEditingContoller = TextEditingController();
TextEditingController get passwordTextEditingController => _passwordTextEditingContoller; 


TextEditingController _konfirmPasswordTextEditingContoller = TextEditingController();
TextEditingController get konfirmPasswordTextEditingController => _konfirmPasswordTextEditingContoller; 



  void showPassword() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  void showConfirmPassword() {
    _confirmPasswordVisible = !_confirmPasswordVisible;
    notifyListeners();
  }
}
