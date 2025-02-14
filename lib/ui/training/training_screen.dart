import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cimb_growthhub_app/bloc/detail_training/detail_training_bloc.dart';
import 'package:cimb_growthhub_app/bloc/training/training_bloc.dart';
import 'package:cimb_growthhub_app/model/response/enroll.dart';
import 'package:cimb_growthhub_app/model/response/traning.dart';
import 'package:cimb_growthhub_app/responsive.dart';
import 'package:cimb_growthhub_app/util/image_random.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {


  @override
  Widget build(BuildContext context) {
    Color setColor(String status) {
      switch (status) {
        case "on progress":
          return Colors.lightBlue;
        case "done":
          return Colors.green;
        default:
          return Colors.grey;
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: RefreshIndicator(
        onRefresh: () {
          return Completer().future;
        },
        child: BlocConsumer<TrainingBloc, TrainingState>(
            listener: (context,state) {
              if (state is TrainingCancelSuccess) {
                SnackBar snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,

                  content: AwesomeSnackbarContent(
                    title: 'Information',
                    message: "Berhasil Membatalkan Training !",
                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.warning,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
                context.read<TrainingBloc>().add(GetTrainingDataByID(id: state.id));
              }

              if (state is TrainingEnrollLSuccess) {
                SnackBar snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,

                  content: AwesomeSnackbarContent(
                    title: 'Information',
                    message: "Berhasil Menambahkan Training !",
                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.help,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
          if (state is TrainingLoading) {
            return Center(child: LoadingAnimationWidget.stretchedDots(
                color: Colors.redAccent,

                size: 100),);
          }
          if (state is TrainingDetailLoaded || state is TrainingEnrollLSuccess || state is TrainingEnrollLLoaded) {
            Enrollment? enrollmentData;
            TrainingData? trainingData;
            if (state is TrainingEnrollLSuccess) {
              enrollmentData = state.enrollmentData;
              trainingData = state.trainingData;
            }
            if (state is TrainingEnrollLLoaded) {
              enrollmentData = state.enrollmentData;
              trainingData = state.trainingData;
            }

            if (state is TrainingDetailLoaded) {
              trainingData = state.data;
            }
            return CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Padding(
                padding: Responsive.isMobile(context) ? EdgeInsets.zero : const EdgeInsets.all(20),

              ),
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 350,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              shadowColor: Color(0x33434343),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(trainingData?.nama ?? "Nama Pelatihan",
                style: TextStyle(fontWeight: FontWeight.w700),),
                centerTitle: false,
                collapseMode: CollapseMode.pin,
                background: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.white, Colors.white.withOpacity(0.05)],
                      stops: [0.7, 1],
                      tileMode: TileMode.repeated,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  child: Image.asset(
                    ImageRandom.randomImageFromAsset(),
                    opacity: const AlwaysStoppedAnimation(.25),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (Responsive.isMobile(context) || Responsive.isTablet(context))
              SliverToBoxAdapter(
                child: Container(
                  margin:  EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 40 : 80,vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 20 : 40,vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      border: Border.all(color: Color(0xFFDDDDDD))
                  ),
                  child: Responsive.isMobile(context) ? MobileContainer() : WebContainer(
                    trainingData: trainingData,
                    enrollmentData: enrollmentData,
                    trainerName: trainingData?.namaTrainer,
                    durasi: trainingData?.durasi.toString(),
                    date: DateFormat("dd MMMM yyyy").format(trainingData?.tanggal ?? DateTime.now()),
                    status: trainingData?.status?.toUpperCase() ?? "",
                    total: trainingData?.kapasitasTersisa ?? 0,
                    totalCapacity: trainingData?.kapasitas ?? 0,
                  ),
                ),
              ),

            if (Responsive.isDesktop(context))
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 30),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 20 : 40,vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFDDDDDD))
                        ),
                        child: WebContainer(
                          trainingData: trainingData,
                          enrollmentData: enrollmentData,
                          trainerName: trainingData?.namaTrainer,
                          durasi: trainingData?.durasi.toString(),
                          date: DateFormat("dd MMMM yyyy").format(trainingData?.tanggal ?? DateTime.now()),
                          status: trainingData?.status?.toUpperCase() ?? "",
                          total: trainingData?.kapasitasTersisa ?? 0,
                          totalCapacity: trainingData?.kapasitas ?? 0,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Tentang Pelatihan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),),
                        SizedBox(width: 15,),
                        Container(

                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black)
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: setColor(trainingData?.status ?? "" ?? ""),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(trainingData?.status?.toUpperCase() ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      trainingData?.deskripsi ?? "",
                    ),
                  ],
                ),
              ),
            )
          ],
        );

          }

          if (state is TrainingError) {
            return Text(state.error);
          }

          return Center(
            child: Text(""),
          );


        }))),
    );
  }
}

class WebContainer extends StatelessWidget {
  final String? trainerName;
  final String? durasi;
  final String? date;
  final int total;
  final int totalCapacity;
  final String? status;
  final TrainingData? trainingData;
  final Enrollment? enrollmentData;

  const WebContainer({super.key, this.trainerName, this.durasi, this.date,  this.total =0,  this.totalCapacity =0,  this.status, this.trainingData, this.enrollmentData});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Responsive.isDesktop(context) ? Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_2_rounded,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      trainerName ?? "Nama Pemateri",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$durasi menit",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 40,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      date ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(
                      Icons.group,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$total/$totalCapacity Terdaftar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ) : Expanded(
            flex: 2,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_2_rounded,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          trainerName ?? "Nama Pemateri",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$durasi menit",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 40,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          date ?? "",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(
                          Icons.group,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$total/$totalCapacity Terdaftar",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
        if (Responsive.isDesktop(context))
          SizedBox(width: 25,),
        SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Status : ${enrollmentData?.status.toUpperCase() ?? "Belum Terdaftar".toUpperCase()}",),
              SizedBox(height: 10,),
              SizedBox(
                width: 200,
                child: TextButton(
                  iconAlignment: IconAlignment.start,
                    style: TextButton.styleFrom(
                      backgroundColor: enrollmentData != null ? Color.fromRGBO(116, 17, 28, 1) :  Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Set the radius here
                      ),
                    ),
                    onPressed: () {
                      if (enrollmentData == null) {
                        if (trainingData != null) {
                          context.read<TrainingBloc>().add(EnrollTraining(trainingData!));
                        }
                      } else {
                        context.read<TrainingBloc>().add(CancelTraining(enrollmentData?.trainingId ?? ""));
                      }
                    } , child: enrollmentData != null ? Text("BATAL") : Text("DAFTAR")),
              )
            ],
          ),
        )
      ],
    );
  }
}

class MobileContainer extends StatelessWidget {
  const MobileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_2_rounded,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Nama Pemateri",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "120 menit",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "12 Februari 2025",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(
                        Icons.group,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2/20 Terdaftar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 30,),
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Status : Belum Terdaftar",

              ),
              SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Set the radius here
                      ),
                    ),
                    onPressed: () {
                    } , child: Text("DAFTAR")),
              )
            ],
          ),
        )
      ],
    );
  }
}

