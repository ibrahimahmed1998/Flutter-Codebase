import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network{
  final String _url = 'http://10.0.2.2:8000/api/auth';
  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post( Uri.parse(fullUrl)
         ,
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();

    return await http.get(
        Uri.parse(fullUrl),
        headers: _setHeaders()
    );
  }


  test2(token) async
  {
    var xz='http://10.0.2.2:8000/api/service/messages';
    // await _getToken();

    return await http.get(
        Uri.parse(xz),
        headers:  {  'Content-type' : 'application/json',
          'Accept' : 'application/json',
           'Authorization' : 'Bearer $token'
        }
    );
  }

  test3(token,data) async
  {
    var xz='http://10.0.2.2:8000/api/service/messages';
    // await _getToken();

    return await http.post(
        Uri.parse(xz),
        body: { 'message':jsonEncode(data)  } ,

        headers:  {
        //  'Content-type' : 'application/json',
        //  'Accept' : 'application/json',
          'Authorization' : 'Bearer $token'
        }
    );
  }




  postData(token,apiUrl) async
  {
    var fullUrl = _url + apiUrl;

    return await http.post(
        Uri.parse(fullUrl),
        headers:  {   'Authorization' : 'Bearer $token'}
    );
  }



  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };

}
