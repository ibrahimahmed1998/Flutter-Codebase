import 'package:flutter/material.dart';
import 'package:shop_app/screens/profile/components/profile_menu.dart';

import '../../constants.dart';



class privilegesdoctor extends StatelessWidget
{
  static String routeName = "/privilegesdoctor";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("Doctor privileges",
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
              text: "Show student midterm degree",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Show student academic record",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Chat",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Post a frequently question",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Show a frequently question",
              icon: "assets/icons/Plus Icon.svg",
              press: () {},
            ),
          ],
        ),
      ),

    );
  }
}