import 'package:cimb_growthhub_app/ui/login/controller/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final Widget prefixIcon;
  final bool isPassword;
  final PasswordType passwordType;
  final List<TextInputFormatter>? formatter;

  const CustomTextFormField({super.key, required this.label, required this.prefixIcon,  this.isPassword = false, this.formatter,  this.passwordType = PasswordType.password});


  bool showPassword(BuildContext context) {
    if (isPassword) {
     switch(passwordType) {
       case PasswordType.password:
         return context.watch<FormController>().passwordVisible;
       case PasswordType.confirmPassword:
         return context.watch<FormController>().confirmPasswordVisible;
     }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              child: TextFormField(
                cursorColor: Colors.grey,
                obscureText: showPassword(context),
                inputFormatters: formatter,
                decoration: InputDecoration(

                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    prefixIcon: prefixIcon,
                    prefixIconColor: Colors.grey,
                    focusColor: Colors.grey,
                    suffixIconColor: Colors.grey,
                    hintText: label,
                    hintStyle: TextStyle(
                      color: Color(0xFFDADADA),
                      fontStyle: FontStyle.italic,
                    ),
                    suffixIcon: isPassword ? IconButton(onPressed: () {
                      switch(passwordType) {
                        case PasswordType.password:
                          context.read<FormController>().showPassword();
                        case PasswordType.confirmPassword:
                          context.read<FormController>().showConfirmPassword();
                      }
                    }, icon: Icon(showPassword(context) ? Icons.visibility : Icons.visibility_off)) : null,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          strokeAlign: 0,
                          color: Colors.white,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.grey,
                        )
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          strokeAlign: 0,
                          color: Colors.transparent,
                        )
                    )
                ),
              ),
            ),
          ],
        ));
  }
}

enum PasswordType {
  password,
  confirmPassword
}

