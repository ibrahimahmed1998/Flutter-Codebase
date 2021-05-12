import 'package:flutter/material.dart';
import 'package:shop_app/screens/profile/components/profile_menu.dart';
import 'package:shop_app/screens/sign_in/sign_up/sign_up_screen.dart';

import '../../constants.dart';
import '../../size_config.dart';



class privilegesadmin extends StatelessWidget
{
  static String routeName = "/privilegesadmin";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("Admin privileges",
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
              text: "Add new student",
              icon: "assets/icons/Plus Icon.svg",
              press: () {Navigator.pushNamed(context, SignUpScreen.routeName);},
            ),
            ProfileMenu(
              text: "Update student final degree",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Update student midterm degree",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
          ],
        ),
      ),



    );
  }
}