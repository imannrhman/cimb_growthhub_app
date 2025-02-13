import 'package:cimb_growthhub_app/responsive.dart';
import 'package:cimb_growthhub_app/ui/login/component/custom_text_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    Widget checkMobile(List<Widget> childs) {
      if (!Responsive.isMobile(context)) {
        return Wrap(
          direction: Axis.horizontal,
          runSpacing: 30,
          spacing: 30,
          children: childs);
      } else {
        return Column(
          spacing: 20,
          children: childs,
        );
      }
    }

    return Scaffold(
      body: SafeArea(child: Center(
        child: Container(
          width: 850,
          margin: const EdgeInsets.symmetric(vertical: 50),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Color(0xFFEAEAEA),
            )
          ),
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: Responsive.isMobile(context) ? const EdgeInsets.all(40) : const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("My Profile", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                  ),
                  Padding(
                    padding: Responsive.isMobile(context) ? const EdgeInsets.all(40) : const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 100,
                            height: 100,
                            child: CircleAvatar(backgroundColor: Colors.grey,)),
                        SizedBox(width: 30,),
                        Expanded(child: Text("John Doe")),
                        TextButton(onPressed: () {}, child: Text("Edit Profile"),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white
                          ),
                        ),
                        SizedBox(width: 40,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  checkMobile([
                    CustomTextFormField(width: 350, label: "username", prefixIcon: Icon(Icons.person_2_rounded)),
                    CustomTextFormField(width: 350, label: "username", prefixIcon: Icon(Icons.person_2_rounded)),
                    CustomTextFormField(width: 350, label: "username", prefixIcon: Icon(Icons.person_2_rounded)),
                    CustomTextFormField(width: 350, label: "username", prefixIcon: Icon(Icons.person_2_rounded)),
                  ]),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

