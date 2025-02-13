import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cimb_growthhub_app/bloc/auth/auth_bloc.dart';
import 'package:cimb_growthhub_app/repository/auth_repository.dart';
import 'package:cimb_growthhub_app/ui/login/controller/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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

    TextEditingController username = context.read<FormController>().usernameTextEditingController;
    TextEditingController password = context.read<FormController>().passwordTextEditingController;
    
    return BlocProvider<AuthBloc>(create: (context) => AuthBloc(AuthRepositoryAPI()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
            if (state is AuthLoginError) {
              SnackBar snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,

                  content: AwesomeSnackbarContent(
                    title: 'On Snap!',
                    message: state.error,
                

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.failure,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              
            } 

            if (state is AuthLoginSuccess) {
              context.pushReplacementNamed("main");
            }
        },
        child: Scaffold(
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
                    CustomTextFormField(controller: context.read<FormController>().usernameTextEditingController,label: "Username", prefixIcon: Icon(Icons.person_2_outlined)),
                    SizedBox(height: 15,),
                    CustomTextFormField(controller: context.read<FormController>().passwordTextEditingController, label: "Password", prefixIcon: Icon(Icons.lock_outline), isPassword: true,),
                    SizedBox(height: 30,),
                    BlocBuilder<AuthBloc, AuthState
                    >(builder: (context,state) =>  SizedBox(
                      height: 40,
                      child: TextButton(
                        onPressed: state is AuthLoading ?  null : () {
                          context.read<AuthBloc>().add(PostLogin(email: username.text, password: password.text));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Set the radius here
                          ),
                        ),
                        child: state is AuthLoading ? LoadingAnimationWidget.inkDrop(color: Colors.white, size: 20) : Text('LOGIN', style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                    ),),
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
        ),
      ),
    );
  }
}

