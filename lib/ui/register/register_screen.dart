import 'package:cimb_growthhub_app/bloc/auth/auth_bloc.dart';
import 'package:cimb_growthhub_app/model/request/register.dart';
import 'package:cimb_growthhub_app/ui/login/component/custom_text_field.dart';
import 'package:cimb_growthhub_app/ui/login/controller/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {

    TextEditingController name = context.read<FormController>().nameTextEditingContoller;
    TextEditingController email = context.read<FormController>().nameTextEditingContoller;
    TextEditingController username = context.read<FormController>().usernameTextEditingController;
    TextEditingController phone = context.read<FormController>().phoneTextEditingController;
    TextEditingController job = context.read<FormController>().jobTextEditingContoller;
    TextEditingController office = context.read<FormController>().offficeTextEditingContoller;
    TextEditingController password = context.read<FormController>().passwordTextEditingController;
    TextEditingController konfirmasi = context.read<FormController>().konfirmPasswordTextEditingController;

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
                  CustomTextFormField(controller: name,label: "Nama Lengkap", prefixIcon: Icon(Icons.abc_outlined)),
                  SizedBox(height: 15,),
                  CustomTextFormField(controller: username , label: "Username", prefixIcon: Icon(Icons.person_2_outlined)),
                  SizedBox(height: 15,),
                  CustomTextFormField(controller: email, label: "Email", prefixIcon: Icon(Icons.email_outlined)),
                  SizedBox(height: 15,),
                  CustomTextFormField(controller: phone, label: "No. Telepon", prefixIcon: Icon(Icons.call), formatter: [FilteringTextInputFormatter.digitsOnly],),
                  SizedBox(height: 15,),
                  CustomTextFormField(label:  "Tanggal Lahir", prefixIcon: Icon(Icons.date_range), formatter: [FilteringTextInputFormatter.digitsOnly], isDate: true,),
                  SizedBox(height: 15,),
                  CustomTextFormField(controller: job, label: "Pekerjaan", prefixIcon: Icon(Icons.work_outline)),
                  SizedBox(height: 15,),
                  CustomTextFormField(controller: office,label: "Perusahaan", prefixIcon: Icon(Icons.home_work_outlined)),
                  SizedBox(height: 15,),
                  CustomTextFormField(controller: password, label: "Password", prefixIcon: Icon(Icons.lock_outline), isPassword: true,),
                  SizedBox(height: 15,),
                  CustomTextFormField(controller: konfirmasi ,label: "Konfirmasi Password", prefixIcon: Icon(Icons.lock_outline), isPassword: true, passwordType: PasswordType.confirmPassword,),
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
                          context.read<AuthBloc>().add(PostRegister(form: RegisterForm(
                            username: username.text, 
                            password: password.text, 
                            nama: name.text, 
                            tglLahir: DateTime.now(), 
                            pekerjaan: job.text, 
                            perusahaan: office.text, 
                            noTelepon:phone.text,
                             email: email.text
                             )));            
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
