import 'package:cimb_growthhub_app/custom_scroll.dart';
import 'package:cimb_growthhub_app/ui/login/controller/form_controller.dart';
import 'package:cimb_growthhub_app/ui/login/login_screen.dart';
import 'package:cimb_growthhub_app/ui/main/main_screen.dart';
import 'package:cimb_growthhub_app/ui/register/register_screen.dart';
import 'package:cimb_growthhub_app/util/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'CIMB Growth Hub',
      scrollBehavior: CustomScrollBehavior(),
      theme: ThemeData(
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
      ),
      routerConfig: router,
    );

  }
}
