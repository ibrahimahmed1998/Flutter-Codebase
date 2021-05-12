import 'package:flutter/material.dart';
import 'package:shop_app/screens/privileges/privileges_admin.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'profile_menu.dart';



class Bodyadmin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            "Hello, Admin",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(25),
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 30),
          Text(
              "Admin Name: Mostafa Reda \nMahmoud",
            style : TextStyle (
                fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Text(
              "Admin ID: 498603486034",
            style : TextStyle (
                fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 300),
          ProfileMenu(
            text: "My privileges",
            icon: "assets/icons/Question mark.svg",
            press: () {Navigator.pushNamed(context, privilegesadmin.routeName);},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {Navigator.pushNamed(context, SignInScreen.routeName);},
          ),
        ],
      ),
    );
  }
}
