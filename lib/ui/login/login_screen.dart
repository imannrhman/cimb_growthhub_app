import 'package:cimb_growthhub_app/ui/login/controller/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import 'component/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 350,
            child: ListView(
              children: [
                SizedBox(
                  height: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset("assets/images/cimb.png")),
                    Text("CIMB Growth Hub",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text("Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30
                      ),
                    ),
                      ],
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(label: "Username", prefixIcon: Icon(Icons.person_2_outlined)),
                SizedBox(height: 15,),
                CustomTextFormField(label: "Password", prefixIcon: Icon(Icons.lock_outline), isPassword: true,),
                SizedBox(height: 30,),
                SizedBox(
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      // Button action
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Set the radius here
                      ),
                    ),
                    child: Text('LOGIN', style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("Tidak Memiliki Akun ? "),
                    TouchableOpacity(
                      onTap: () {
                        context.go("/register");
                      },
                      child: Text("Register",
                        style: TextStyle(
                          color: Colors.redAccent
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

