import 'package:cimb_growthhub_app/ui/login/controller/form_controller.dart';
import 'package:cimb_growthhub_app/ui/login/login_screen.dart';
import 'package:cimb_growthhub_app/ui/main/controller/main_controller.dart';
import 'package:cimb_growthhub_app/ui/main/main_screen.dart';
import 'package:cimb_growthhub_app/ui/register/register_screen.dart';
import 'package:cimb_growthhub_app/ui/training/training_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/profile/profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: 'main',
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => FormController(),
            ),
          ],
          child: ProfileScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
      routes: [
        GoRoute(
          name: 'training',
          path: '/training',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => FormController(),
                ),
              ],
              child: TrainingScreen(),
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                FadeTransition(opacity: animation, child: child),
          ),
        ),
      ]
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => FormController(),
            ),
          ],
          child: LoginScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => FormController(),
            ),
          ],
          child: RegisterScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
  ],
);
