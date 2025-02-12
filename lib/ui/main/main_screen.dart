import 'package:cimb_growthhub_app/responsive.dart';
import 'package:cimb_growthhub_app/ui/login/component/custom_text_field.dart';
import 'package:cimb_growthhub_app/ui/main/component/side_menu.dart';
import 'package:cimb_growthhub_app/ui/main/controller/main_controller.dart';
import 'package:flexible_grid_view/flexible_grid_view.dart';
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
      key: context.read<MainController>().scaffoldKey,
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
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 400,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    "assets/images/task.png",
                    width: 300,
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
    return ListView();
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
    ScrollController controller =
        context.read<MainController>().scrollController;
    if (controller.hasClients) {
      controller.addListener(() {
        context.read<MainController>().checkScroll();
      });
    }
    int length = 10;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 80),
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
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 25, fontWeight: FontWeight.w600, color: color),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.white, Colors.white.withOpacity(0.06)],
                      stops: [0.8, 1],
                      tileMode: TileMode.mirror,
                    ).createShader(bounds);
                  },
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [Colors.white, Colors.white.withOpacity(0.06)],
                        stops: [0.95, 1],
                        tileMode: TileMode.mirror,
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ).createShader(bounds);
                    },
                    child: ListView.builder(
                        controller:
                            context.read<MainController>().scrollController,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 50 : 0,
                                right: index == length ? 60 : 20),
                            child: TrainingCardView(),
                          );
                        }),
                  ),
                ),
                if (!context.watch<MainController>().isFirstIndex)
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 20,
                    child: TouchableOpacity(
                      onTap: () {
                        context.read<MainController>().backScroll();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left_outlined,
                          size: 40,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                if (!context.watch<MainController>().maxScroll)
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 20,
                    child: TouchableOpacity(
                      onTap: () {
                        context.read<MainController>().nextScroll();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 40,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
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
              SizedBox(
                width: 400,
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
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.isDesktop(context) ? 4 : 3,
                mainAxisExtent: 300,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20, // Set fixed height for each item
              ),
              itemBuilder: (context, index) {
                return TrainingCardView();
              })
        ],
      ),
    );
  }
}

class TrainingCardView extends StatelessWidget {
  const TrainingCardView({super.key});

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
            border: Border.all(
              color: Color(0xFFEAEAEA),
            )),
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
