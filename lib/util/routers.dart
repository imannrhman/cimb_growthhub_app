import 'package:cimb_growthhub_app/bloc/auth/auth_bloc.dart';
import 'package:cimb_growthhub_app/bloc/my_training/my_training_bloc.dart';
import 'package:cimb_growthhub_app/bloc/training/training_bloc.dart';
import 'package:cimb_growthhub_app/repository/auth_repository.dart';
import 'package:cimb_growthhub_app/repository/training_repository.dart';
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
              create: (context) => MainController()..checkLogin(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
                BlocProvider<MyTrainingBloc>(create: (context) => MyTrainingBloc(TrainingRepositoryAPI())..add(GetMyTrainingData()),),
                BlocProvider<TrainingBloc>(create: (context) => TrainingBloc(TrainingRepositoryAPI())..add(GetTrainingData()),)
            ],
            child: MainScreen()),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),

       GoRoute(
          name: 'training',
         path: '/training',
          pageBuilder: (context, state) {
            String trainingId = state.uri.queryParameters['training_id'] ?? '';
            String enrolledId = state.uri.queryParameters['enroll_id'] ?? '';
            return CustomTransitionPage(
            key: state.pageKey,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => FormController(),
                ),
                ChangeNotifierProvider(
                  create: (context) => MainController(),
                ),
              ],
              child: MultiBlocProvider(providers: [
                if (enrolledId.isNotEmpty)
                  BlocProvider<TrainingBloc>(create: (context) => TrainingBloc(TrainingRepositoryAPI())..add(GetEnrolledTraining(
                      trainingId: trainingId,
                      id: enrolledId,
                  )),),
                if (enrolledId.isEmpty)
                  BlocProvider<TrainingBloc>(create: (context) => TrainingBloc(TrainingRepositoryAPI())..add(GetTrainingDataByID(
                    id: trainingId,
                  )),)
              ], child: TrainingScreen()
              ),
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                FadeTransition(opacity: animation, child: child),
          );
          },
        ),
      
    GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(create: (context) => AuthBloc(AuthRepositoryAPI()),
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => FormController(),
              ),
            ],
            child: LoginScreen()
            
          ),
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
          child: BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(AuthRepositoryAPI()),
            child: RegisterScreen()),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
  ],
);
