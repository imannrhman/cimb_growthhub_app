import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cimb_growthhub_app/bloc/my_training/my_training_bloc.dart';
import 'package:cimb_growthhub_app/bloc/training/training_bloc.dart';
import 'package:cimb_growthhub_app/model/response/user_profile.dart';
import 'package:cimb_growthhub_app/responsive.dart';
import 'package:cimb_growthhub_app/ui/login/component/custom_text_field.dart';
import 'package:cimb_growthhub_app/ui/main/component/side_menu.dart';
import 'package:cimb_growthhub_app/ui/main/controller/main_controller.dart';
import 'package:cimb_growthhub_app/util/image_random.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import 'package:provider/provider.dart';

import '../../model/response/traning.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MainController>().scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(backgroundColor: Colors.grey)),
                  SizedBox(height: 10,),
                  Text("John Doe", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),),
                  SizedBox(height: 30,),
                  ListTile(
                    leading: Icon(Icons.home_filled),
                    title: Text("Halaman Utama"),
                    hoverColor: Colors.grey,
                  ),
                  ListTile(
                    leading: Icon(Icons.person_2_rounded),
                    title: Text("Profile"),
                  )
                ],
              ),
            )),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:Color(0xFFEF3D3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Set the radius here
                        ),
                      ),
                      onPressed: () {
                        context.go("/login");
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor:Color(0xFFEF3D3D),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Set the radius here
                        ),
                      ),
                      onPressed: () {
                        context.go("/register");
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Responsive(
        mobile: MainMobileScreen(),
        desktop: MainWebScreen(),
        tablet: MainWebScreen(),
      ),
    );
  }
}

class MainWebScreen extends StatelessWidget {
  const MainWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 100, left: 40),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/images/cimb.png"))),
                      Text(
                        "CIMB Growth Hub",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),

                if (!context.watch<MainController>().isLogin)
                   Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:Color(0xFFEF3D3D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25), // Set the radius here
                          ),
                        ),
                        onPressed: () {
                          context.go("/login");
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor:Color(0xFFEF3D3D),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25), // Set the radius here
                          ),
                        ),
                        onPressed: () {
                          context.go("/register");
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),

                if (context.watch<MainController>().isLogin)
                  Row(children: [
                    CircleAvatar(child: CachedNetworkImage(imageUrl: "https://avatar.iran.liara.run/public",),),
                    SizedBox(width: 20,),
                    Text("Hallo, ${context.watch<MainController>().profile?.profile.nama ?? ""}!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    ),

                  ],)
               ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          if (context.watch<MainController>().isLogin)
            SizedBox(
            height: 500,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    "assets/images/task.png",
                    width: 360,
                  ),
                ),
                Expanded(
                  child: MyTrainingContainer(
                    name: "Training Ku!",
                    color: Colors.white,
                    shadows: [],
                    backgroundColor: Color(0xFFEF3D3D),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 100,
          ),
          TrainingContainer(),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class MainMobileScreen extends StatelessWidget {
  const MainMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppBar(
          leading: IconButton(onPressed: () {
            context.read<MainController>().controlMenu();
          }, icon: Icon(Icons.menu)),
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 30,
                  width: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/images/cimb.png"))),
              SizedBox(width: 10,),
              Text(
                "CIMB Growth Hub",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        SizedBox(height: 20,),
        MyTrainingContainer(name: "Training Ku!", color: Colors.redAccent, shadows: []),
        SizedBox(height: 30,),
        TrainingMobileContainer(),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

class MyTrainingContainer extends StatelessWidget {
  final String name;
  final Color color;
  final List<BoxShadow> shadows;
  final Color? backgroundColor;

  const MyTrainingContainer(
      {super.key,
      required this.name,
      required this.color,
      required this.shadows,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: Responsive.isMobile(context) ? const EdgeInsets.symmetric(horizontal: 16) : const EdgeInsets.symmetric(horizontal: 80),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              children: [
                Icon(
                  Icons.chrome_reader_mode_outlined,
                  size: Responsive.isMobile(context) ? 20 : 25,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: Responsive.isMobile(context) ? 20 : 25, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<MyTrainingBloc, MyTrainingState>(builder: (context, state) {
            if (state is MyTrainingLoaded) {
              if (state.enrollments.isNotEmpty) {
                return SizedBox(
                  height: 400,
                  child: ListView.builder(
                      controller:
                      context.read<MainController>().scrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.enrollments.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? 50 : 0,
                              right: index ==  state.enrollments.length ? 60 : 20),
                          child: TrainingCardView(
                            onTap: () {
                              context.go("/training?training_id=${state.enrollments[index].training?.id}&enroll_id=${state.enrollments[index].id}");
                            },
                            trainingName: state.enrollments[index].training?.nama,
                            date: DateFormat("dd MMM yyyy").format(state.enrollments[index].training?.tanggal ?? DateTime.now()),
                            status: state.enrollments[index].training?.status,
                            trainerName: state.enrollments[index].training?.namaTrainer,
                            duration: state.enrollments[index].training?.durasi.toString(),
                          ),
                        );
                      }),
                );
              } else {

              }
            }
            return  Column(
              children: [
                SizedBox(height: 100,),
                Center(child: Text("Anda Belum Menambahkan Pelatihan",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                )),
              ],
            );;
          }),
        ],
      ),
    );
  }
}

class TrainingContainer extends StatelessWidget {
  const TrainingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "List Training",
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              BlocBuilder<TrainingBloc, TrainingState>(builder: (context, state) {
                return SizedBox(
                  width: 400,
                  child: TextFormField(
                    onChanged: (val) => context.read<TrainingBloc>().add(SearchEvent(query: val),),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.black87,
                        focusColor: Colors.black87,
                        suffixIconColor: Colors.black87,
                        hintText: "Search...",
                        hintStyle: TextStyle(
                          color: Color(0xFFDADADA),
                          fontStyle: FontStyle.italic,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            borderSide: BorderSide(
                              strokeAlign: 0,
                              color: Color(0xFFEAEAEA),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black87,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            borderSide: BorderSide(
                              strokeAlign: 0,
                              color: Colors.black87,
                            ))),
                  ),
                );
              })
            ],
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<TrainingBloc, TrainingState>(builder: (context, state) {

            if (state is TrainingLoading) {
              return Center(
                child: LoadingAnimationWidget.dotsTriangle(color: Colors.redAccent, size: 20),
              );
            }
            if (state is TrainingLoaded) {
              return BlocBuilder<MyTrainingBloc, MyTrainingState>(
  builder: (context, enrolled) {
    List<TrainingData> training = state.data;
    if (enrolled is MyTrainingLoaded) {
      List<String> enrolledTraining = enrolled.enrollments.map((val) => val.trainingId).toList();
      training = training.where((val)=> !enrolledTraining.any((enroll) => enroll == val.id)).toList();

    }
    return GridView.builder(
              shrinkWrap: true,
              itemCount: training.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.isDesktop(context) ? 4 : 3,
                mainAxisExtent: 400,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20, // Set fixed height for each item
              ),
              itemBuilder: (context, index) {
                return TrainingCardView(
                  onTap: () {
                    if (context.read<MainController>().isLogin) {
                      context.go("/training?training_id=${training[index].id}");
                    } else {
                      AwesomeDialog(
                          context: context,
                          dialogBackgroundColor: Colors.white,
                          dialogType: DialogType.question,
                          width: 500,
                          animType: AnimType.rightSlide,
                          title: 'Butuh Login :(',
                          desc: 'Login Sekarang ?',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            context.go('/login');
                          },
                    ).show();
                    }
                  },
                  status: training[index].status,
                  trainingName: training[index].nama,
                  trainerName: training[index].namaTrainer,
                  duration: training[index].durasi.toString(),
                  date:DateFormat("dd MMM yyyy").format(training[index].tanggal ?? DateTime.now()),
                );
              });
  },
);
            }

            if (state is TrainingError) {
              return Text(state.error);
            }
            return Container();
          })
        ],
      ),
    );
  }
}

class TrainingMobileContainer extends StatelessWidget {
  const TrainingMobileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "List Training",
            style: GoogleFonts.plusJakartaSans(
                fontSize: 25, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.black87,
                  focusColor: Colors.black87,
                  suffixIconColor: Colors.black87,
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    color: Color(0xFFDADADA),
                    fontStyle: FontStyle.italic,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        strokeAlign: 0,
                        color: Color(0xFFEAEAEA),
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black87,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        strokeAlign: 0,
                        color: Colors.black87,
                      ))),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return SizedBox(
                    height: 360,
                    child: TrainingCardView(

                    ));
              }, separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10,);
          },

              )
        ],
      ),
    );
  }
}


class TrainingCardView extends StatelessWidget {
  final String? trainingName;
  final String? trainerName;
  final String? duration;
  final String? date;
  final GestureTapCallback? onTap;
  final String? status;

  const TrainingCardView({super.key, this.trainingName, this.trainerName, this.duration, this.date, this.onTap, this.status});

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

    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        width: 360,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(
              color: Color(0xFFEAEAEA),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          ImageRandom.randomImageFromAsset(),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    if (status?.isNotEmpty ?? false)
                        Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: setColor(status ?? ""),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(status?.toUpperCase() ?? "",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                )),
            SizedBox(
              height: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Text(
                      trainingName ?? "Test Training",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.person_2_rounded, size: 18,),
                        SizedBox(width: 5,),
                        Text(
                          trainerName ?? "Nama Trainer",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],),
                ),
                Row(
                  children: [
                    Icon(Icons.timelapse_outlined, color: Colors.black87,),
                    SizedBox(width: 5,),
                    Text(
                      "${duration ?? 0} menit",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                          color: Colors.black87
                      ),
                    ),
                    Spacer(),
                    Text(
                      date ?? "-",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
