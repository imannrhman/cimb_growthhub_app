import 'package:flutter/material.dart';

class FormController extends ChangeNotifier {
  bool _passwordVisible = true;
  bool get passwordVisible => _passwordVisible;

  bool _confirmPasswordVisible = true;
  bool get confirmPasswordVisible => _confirmPasswordVisible;

  void showPassword() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  void showConfirmPassword() {
    _confirmPasswordVisible = !_confirmPasswordVisible;
    notifyListeners();
  }
}
