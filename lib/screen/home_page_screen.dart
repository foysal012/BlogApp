
import 'dart:convert';

import 'package:blog_app/provider/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {



  var data;

  Future<void> getAllBlog() async{

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
      print(response.body);

      if(response.statusCode == 200){
         data = jsonDecode(response.body);
        print(data["data"]);

        return data;
      }

    } catch (e){
      print(e.toString());
    }
   // notifyListeners();




  }
  @override
  Widget build(BuildContext context) {

    var dat = getAllBlog();

    var authServices = Provider.of<AuthServices>(context, listen: false);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HomePage",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff4AA4D6),
          fontSize: 25,
          letterSpacing: 2,
        ),
        ),

        actions: [
          IconButton(
              onPressed: (){
                authServices.setSignOut(context);
              },
              icon: Icon(Icons.logout, color: Color(0xff4AA4D6),)
          )
        ],
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 20,
          right: 20
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),

            Expanded(
                child: FutureBuilder(
                  future: getAllBlog(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData){
                      return Text("No Blog Found there");
                    } else if( snapshot.connectionState == ConnectionState.waiting){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: Color(0xff4AA4D6),),
                          Text("Loading...")
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Text(data["data"]["blogs"]["current_page"].toString()),
                          //Text(data["data"]["blogs"]["data"].toString()),
                          Text(data["data"]["blogs"]["first_page_url"]),
                          //Text(data["data"]["blogs"]["from"]),
                          Text(data["data"]["blogs"]["last_page"].toString()),
                          Expanded(
                              child: ListView.builder(

                                  itemBuilder: (context, index){
                                return Row(
                                  children: [
                                    Text(data["data"]["blogs"]["links"][index]["label"]),
                                    //Text(data["data"]["blogs"]["links"][index]["active"]),
                                  ],
                                );
                              },
                              itemCount: data["data"]["blogs"]["links"].length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,

                              )

                          ),
                          Text(data["data"]["blogs"]["path"]),
                          Text(data["data"]["blogs"]["per_page"].toString()),
                          Text(data["data"]["blogs"]["total"].toString()),
                          Text(data["message"]),
                          Text(data["status"].toString()),


                        ],
                      );
                    }
                  },
                )
            )


          ],
        ),
      ),
    );
  }
}
