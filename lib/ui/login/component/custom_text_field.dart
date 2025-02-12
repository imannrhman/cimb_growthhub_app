import 'package:cimb_growthhub_app/ui/login/controller/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final Widget prefixIcon;
  final bool isPassword;
  final bool isDate;
  final PasswordType passwordType;
  final List<TextInputFormatter>? formatter;

  const CustomTextFormField({super.key, required this.label, required this.prefixIcon,  this.isPassword = false, this.formatter,  this.passwordType = PasswordType.password, this.isDate = false});


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
              child: TouchableOpacity(
                onTap: () {
                  showDatePicker(context: context, firstDate: DateTime.now().copyWith(year: 1900), lastDate: DateTime.now());

                },
                child: TextFormField(
                  onTap: () {

                  },
                  cursorColor: Colors.grey,
                  obscureText: showPassword(context),
                  inputFormatters: formatter,
                  decoration: InputDecoration(
                      filled: true,
                      enabled: !isDate,
                      fillColor: Color(0xFFF5F5F5),
                      prefixIcon: prefixIcon,
                      prefixIconColor: Colors.grey,
                      focusColor: Colors.grey,
                      suffixIconColor: Colors.grey,
                      hintText: isDate ? "dd/MM/yyyy" : label,
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
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.transparent,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          borderSide: BorderSide(
                            width: 2,
                            color: isDate ? Colors.transparent : Colors.grey,
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
            ),
          ],
        ));
  }
}

enum PasswordType {
  password,
  confirmPassword
}

