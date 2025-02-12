import 'package:cimb_growthhub_app/responsive.dart';
import 'package:cimb_growthhub_app/ui/main/component/side_menu.dart';
import 'package:cimb_growthhub_app/ui/main/controller/menu_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      backgroundColor: Color(0xFFF9FBFF),
      body: Responsive(mobile: MainMobileScreen(), desktop: MainWebScreen(), tablet: MainWebScreen(),),
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
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          backgroundColor: WidgetStatePropertyAll(Color(0xFFEF3D3D)),
                        ),
                        onPressed: () {
                          context.go("/login");
                        },
                        child: Text('Login', style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                    ),
                    SizedBox(width: 20,),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(Color(0xFFEF3D3D)),
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                        onPressed: () {
                          context.go("/register");
                        },
                        child: Text('Register', style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 100,),
          SizedBox(
            height: 500,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset("assets/images/task.png", width: 300,),
                ),
                Expanded(
                  child: TrainingContainer(
                    name: "Training Ku",
                    color: Colors.white,
                    shadows: [],
                    backgroundColor: Color(0xFFEF3D3D),
                  ),
                ),
              ],
            ),
          ),

          TrainingContainer(
            name: "List Training",
            color: Colors.black87,
            shadows: [
              BoxShadow(
                color: Color.fromRGBO(18, 44, 74, 0.06),
                blurRadius: 28,
                offset: Offset(0, 6.12),
                spreadRadius: 20,
              )
            ],
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

    );
  }
}



class TrainingContainer extends StatelessWidget {
  final String name;
  final Color color;
  final List<BoxShadow> shadows;
  final Color? backgroundColor;

  const TrainingContainer(
      {super.key,
      required this.name,
      required this.color,
      required this.shadows, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (backgroundColor != null)
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(30)
            ),
            height: 400,
            margin: const EdgeInsets.symmetric( horizontal: 40),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 25, fontWeight: FontWeight.w600, color: color),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                child: Responsive.isMobile(context)
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return TrainingCardView(shadows: shadows);
                        })
                    : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: TrainingCardView(shadows: shadows),
                      );
                    }),
              ),
            ],
          ),
        ),

      ],
    );
  }
}

class TrainingCardView extends StatelessWidget {
  final List<BoxShadow> shadows;

  const TrainingCardView({super.key, required this.shadows});

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        context.go("/training");
      },
      child: Container(
        width: 300,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: shadows,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://picsum.photos/250?image=9",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Test Training",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Nama Trainer",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      size: 12,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "120 menit",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      size: 12,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "12 Februari 2025",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
