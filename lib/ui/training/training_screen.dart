import 'dart:async';

import 'package:cimb_growthhub_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: RefreshIndicator(
        onRefresh: () {
          return Completer().future;
        },
        child: CustomScrollView(
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
                title: Text("Nama Pelatihan",
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
                  child: Image.network(
                    "https://picsum.photos/250?image=9",
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
                  child: Responsive.isMobile(context) ? MobileContainer() : WebContainer(),
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
                        child: WebContainer(),
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
                    Text("Tentang Pelatihan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      """
                      Lorem ipsum odor amet, consectetuer adipiscing elit. Blandit fusce magnis nunc mollis sit tristique torquent. Libero est tortor nisl nec nibh. Enim habitant ipsum mattis libero magna. Interdum molestie class dis natoque porttitor interdum penatibus metus. Dignissim vehicula duis porta aenean vestibulum pulvinar. Netus lacinia eros facilisi euismod nascetur mauris. Magna netus nostra fames a litora id augue. Fringilla inceptos sollicitudin vulputate id semper vestibulum dis mi. Lectus pharetra elementum rutrum volutpat nunc dignissim pretium.
        
        Elit accumsan quis varius torquent interdum porta ultrices cubilia. Odio elementum aliquam duis aptent volutpat elit mauris platea. Cubilia id vitae nostra diam nisi finibus suscipit pretium sit. Facilisi semper viverra at phasellus netus ut vitae. Egestas nisl vehicula; nam habitant viverra magnis porttitor habitant condimentum. Auctor neque montes elit netus morbi augue sollicitudin.
        
        Risus orci sagittis curabitur per venenatis fermentum. Senectus potenti natoque nisl velit metus elit nulla sapien eget. Tortor class eleifend ultricies urna pretium augue. Praesent scelerisque sodales magna dapibus enim tristique. Integer molestie quisque sem auctor nisl, vivamus inceptos. Mollis ultrices habitant odio suscipit, ultrices ultricies sem sed.
        
        Ridiculus dolor massa fermentum faucibus blandit posuere parturient hendrerit turpis. Blandit nostra consequat vestibulum vulputate euismod. Litora faucibus magnis fermentum in montes. Quisque sed tellus volutpat; eleifend sollicitudin scelerisque feugiat. Cubilia magnis metus risus, consectetur placerat faucibus! Dictum felis suspendisse nostra nec risus.
        
        Maecenas auctor condimentum lectus ipsum suspendisse litora, sodales nisl magnis. Enim facilisi sociosqu aliquam nullam est elementum mi vel. Parturient fusce etiam dolor mus rhoncus. Habitant lacinia elementum penatibus tempus turpis volutpat. Ornare cras ullamcorper in orci pellentesque orci. Tempor fames sit ipsum pellentesque eleifend urna risus. Orci nec metus urna leo maximus at torquent. Aliquet faucibus orci turpis hac ante est dictum. Lacinia magna ut congue lacus erat scelerisque. Nam curae metus augue montes morbi.
        
        Scelerisque a orci ligula euismod dignissim justo ex. Aenean auctor quisque himenaeos urna mauris platea litora elementum. Mi sed eget tempus ultricies congue. Dolor aenean suscipit mollis turpis urna vulputate volutpat. Quisque quisque taciti convallis venenatis odio. Parturient nam fermentum nostra, enim quam lobortis magna blandit. Mi nam vel lobortis imperdiet quam amet. Interdum etiam dictum rhoncus commodo ipsum maecenas. Rhoncus sed nullam nam habitasse aliquet.
                      """
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class WebContainer extends StatelessWidget {
  const WebContainer({super.key});

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
                      "Nama Pemateri",
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
                      "120 menit",
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
                      "12 Februari 2025",
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
                      "2/20 Terdaftar",
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
                          "Nama Pemateri",
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
                          "120 menit",
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
                          "12 Februari 2025",
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
                          "2/20 Terdaftar",
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
              Text("Status : Belum Terdaftar",

              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 200,
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

