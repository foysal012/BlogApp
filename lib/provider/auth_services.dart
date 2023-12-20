import 'dart:convert';

import 'package:blog_app/authentication/signin_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices with ChangeNotifier{


  Future<void> setSignin(String email, String password) async{

    try{
      String baseUrl ="https://apitest.smartsoft-bd.com/api/";

      var response = await http.post(Uri.parse(baseUrl+"login"),
      body: {
        "email" : email,
        "password" : password,
      }
      );

      print(response.statusCode);
      //print(response.body);

      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        print(data["data"]["token"]);

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        if(data["data"]["token"] != null){
          sharedPreferences.setString("token", "${data["data"]["token"]}");
        }else{

        }
      }

    } catch (e){
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> setSignOut(BuildContext context) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token")!= null || sharedPreferences.getString("token") == null){
      sharedPreferences.remove("token").then((value) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SigninPageScreen()));
      });
    }
    notifyListeners();
  }

}