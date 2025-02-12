import 'package:cimb_growthhub_app/ui/login/component/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 350,
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  SizedBox(
                    height: 100,
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
                      Text("Register",
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
                  CustomTextFormField(label: "Nama Lengkap", prefixIcon: Icon(Icons.abc_outlined)),
                  SizedBox(height: 15,),
                  CustomTextFormField(label: "Username", prefixIcon: Icon(Icons.person_2_outlined)),
                  SizedBox(height: 15,),
                  CustomTextFormField(label: "Email", prefixIcon: Icon(Icons.email_outlined)),
                  SizedBox(height: 15,),
                  CustomTextFormField(label: "No. Telepon", prefixIcon: Icon(Icons.call), formatter: [FilteringTextInputFormatter.digitsOnly],),
                  SizedBox(height: 15,),
                  CustomTextFormField(label: "Pekerjaan", prefixIcon: Icon(Icons.work_outline)),
                  SizedBox(height: 15,),
                  CustomTextFormField(label: "Perusahaan", prefixIcon: Icon(Icons.home_work_outlined)),
                  SizedBox(height: 15,),
                  CustomTextFormField(label: "Password", prefixIcon: Icon(Icons.lock_outline), isPassword: true,),
                  SizedBox(height: 15,),
                  CustomTextFormField(label: "Konfirmasi Password", prefixIcon: Icon(Icons.lock_outline), isPassword: true, passwordType: PasswordType.confirmPassword,),
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
                      child: Text('REGISTER', style: TextStyle(fontWeight: FontWeight.w600),),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("Sudah Memiliki Akun ? "),
                      TouchableOpacity(
                        onTap: () {
            
                        },
                        child: Text("Login",
                          style: TextStyle(
                              color: Colors.redAccent
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
