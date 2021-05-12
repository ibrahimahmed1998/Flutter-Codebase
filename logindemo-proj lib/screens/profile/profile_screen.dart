import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_in/components/sign_form.dart';
import 'components/body_admin.dart';
import 'components/body_student.dart';
import 'components/body_doctor.dart';
import 'package:shop_app/constants.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";
  String email;
  String password;
  User x;
  User y;
  User z;
  ProfileScreen({this.email,this.password,this.x,this.y,this.z}) ;
  @override
  _ProfileScreen createState() => _ProfileScreen(email,password,x,y,z);
}

class _ProfileScreen extends State<ProfileScreen> {

  String email;
  String password;
  User x;
  User y;
  User z;
  _ProfileScreen(this.email,this.password,this.x,this.y,this.z) ;

  @override
  Widget build(BuildContext context) {

if (email == widget.x.email && password == widget.x.password)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("Profile",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color : Colors.white70,
        ),
        ),
      ),


      body: Bodyadmin()
    ,

    );
  }
else if (email == widget.y.email && password == widget.y.password)
  {return Scaffold(
    appBar: AppBar(
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      title: Text("Profile"),
    ),


    body: Bodydoctor()
    ,

  );
  }
else if (email == widget.z.email && password == widget.z.password)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("Profile"),
      ),


      body: Bodystudent()
      ,

    );
  }
  }
}



