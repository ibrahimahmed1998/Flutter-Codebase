import 'package:flutter/widgets.dart';

import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';

import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/privileges/privileges_admin.dart';
import 'package:shop_app/screens/privileges/privileges_doctor.dart';
import 'package:shop_app/screens/privileges/privileges_student.dart';
import 'package:shop_app/screens/privileges/student_privileges/course_reg.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/sign_in/sign_up/sign_up_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';



// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName:(context)=>SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  privilegesadmin.routeName : (context) => privilegesadmin(),
  privilegesdoctor.routeName : (context) => privilegesdoctor(),
  privilegesstudent.routeName : (context) => privilegesstudent(),
  RegistPage.routeName : (context) => RegistPage(),
};
