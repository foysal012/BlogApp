import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BlogListServices with ChangeNotifier{

 Future<dynamic> getAllBlog() async{

  var data;

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var token = sharedPreferences.getString("token");

  try{
    String baseUrl ="https://apitest.smartsoft-bd.com/api/";

    var response = await http.get(Uri.parse(baseUrl+"admin/blog-news"),
      headers: {
      "Authorization": "Bearer $token",
      }
    );

    print(response.statusCode);
    //print(response.body);

    if(response.statusCode == 200){
       data = jsonDecode(response.body);
      print(data["data"]);

      //return data;
    }
    return data;

  } catch (e){
    print(e.toString());
  }
  notifyListeners();

}

}