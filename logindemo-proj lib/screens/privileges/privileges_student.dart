import 'package:flutter/material.dart';
import 'package:shop_app/screens/privileges/student_privileges/course_reg.dart';
import 'package:shop_app/screens/profile/components/profile_menu.dart';

import '../../constants.dart';



class privilegesstudent extends StatelessWidget
{
  static String routeName = "/privilegesstudent";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("Student privileges",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color : Colors.white70,
          ),
        ),
      ),


      body:
      SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            ProfileMenu(
              text: "Advise for semester",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Most frequently question",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Advise for all years",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Course registration",
              icon: "assets/icons/Plus Icon.svg",
              press: () {Navigator.pushNamed(context, RegistPage.routeName);},
            ),
            ProfileMenu(
              text: "My academic record",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "My midterm degrees",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Chat",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),

          ],
        ),
      ),

    );
  }
}