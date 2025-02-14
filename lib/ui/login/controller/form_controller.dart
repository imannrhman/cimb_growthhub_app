import 'package:flutter/material.dart';

class FormController extends ChangeNotifier {
  bool _passwordVisible = true;
  bool get passwordVisible => _passwordVisible;

  bool _confirmPasswordVisible = true;
  bool get confirmPasswordVisible => _confirmPasswordVisible;

  TextEditingController _usernameTextEditingContoller = TextEditingController();
  TextEditingController get usernameTextEditingController => _usernameTextEditingContoller;

  TextEditingController _nameTextEditingContoller = TextEditingController();
  TextEditingController get nameTextEditingController => _nameTextEditingContoller;


  TextEditingController _emailTextEditingContoller = TextEditingController();
  TextEditingController get emailTextEditingController => _emailTextEditingContoller;

  TextEditingController _dateTextEditingController = TextEditingController();
  TextEditingController get dateTextEditingController => _dateTextEditingController;


  DateTime _date = DateTime.now();
  DateTime get date => _date; 

  TextEditingController _jobTextEditingContoller = TextEditingController();
  TextEditingController get jobTextEditingController => _jobTextEditingContoller;

  TextEditingController _officeTextEditingContoller = TextEditingController();
  TextEditingController get officeTextEditingController => _officeTextEditingContoller;

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

  void changeDate(DateTime dateTime) {
    _date = dateTime;
    notifyListeners();
  }
}
