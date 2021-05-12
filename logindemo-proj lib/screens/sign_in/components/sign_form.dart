import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';

import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  final User x= User(1,'123456asu','admin',"admin@asu.com","Ahmed");
  final User y= User(2,'123456asu','doctor',"doctor@asu.com","Mohamed");
  final User z= User(3,'123456asu','student',"student@asu.com","Mostafa");
  @override
  _SignFormState createState() => _SignFormState();
}
class User {
  int acid;
  String password;
  String type;
  String email;
  String name;
  User(this.acid,this.password,this.type,this.email,this.name);
}

class _SignFormState extends State<SignForm> {
  User x= User(1,'123456asu','admin',"admin@asu.com","Ahmed");
  User y= User(2,'123456asu','doctor',"doctor@asu.com","Mohamed");
  User z= User(3,'123456asu','student',"student@asu.com","Mostafa");


  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    String m=widget.x.password;

    return Form(
      key: _formKey,
      child: Column(

        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [

              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),



              Text("Remember me",
                  style: TextStyle(fontSize: getProportionateScreenWidth(10))),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline,
                      fontSize:getProportionateScreenWidth(10)),


                ),
              )
            ]
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),

          DefaultButton(
            text: "Continue",
            press: () {

              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                // if all are valid then go to success screen


                if (_emailTextController.text == widget.x.email && _passwordTextController.text == widget.x.password ||
                    _emailTextController.text == widget.y.email && _passwordTextController.text == widget.y.password||
                    _emailTextController.text == widget.z.email && _passwordTextController.text == widget.z.password) {

                    String email = _emailTextController.text;
                    String password = _passwordTextController.text;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            ProfileScreen(email: email,
                                password: password,
                                x: x,
                                y: y,
                                z: z)));

                }
              }
            },
          ),


          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Back",
            press: () {
              {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (BuildContext context) => SplashScreen()));
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
          else if (value != widget.x.password ||
                   value != widget.y.password ||
                   value != widget.z.password)
            {
              removeError(error: kAccountPassError);
            }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        else if (value != widget.x.password ||
            value != widget.y.password ||
            value != widget.z.password)
        {
          addError(error: kAccountPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
      controller: _passwordTextController,
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
        controller: _emailTextController,
    );
  }
}
