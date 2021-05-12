import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:logindemo/screen/login.dart';
import 'package:logindemo/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
{
  String name;
  @override
  void initState(){
    _loadUserData();
    super.initState();
  }
  _loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('name'));
   // var token = jsonDecode(localStorage.getString('token'));

    if(user != null) {
      setState(() {
        name = user;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Hi, $name',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Center(
              child: RaisedButton(
                elevation: 10,
                onPressed: (){
                  logout();
                },
                color: Colors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }



  void logout() async{

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    //String token = jsonDecode(localStorage.getString('token'));
    String token1 ="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTYxOTk5Nzg4MCwiZXhwIjoxNjIwMDAxNDgwLCJuYmYiOjE2MTk5OTc4ODAsImp0aSI6IjBkcjFrUURPNXVNcTh4SWQiLCJzdWIiOjE5OTgsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.oRpw0S2nPShJm3GpIAD3soLGoCSkjT3aOlThWTGjLVY";
    var res = await Network().postData(token1,'/logout');
    var body = json.decode(res.body);
  print(body);
    if(body['success'] != null ){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Login()));
    }
  }

}

