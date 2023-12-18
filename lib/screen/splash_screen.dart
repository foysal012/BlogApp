import 'dart:async';

import 'package:blog_app/authentication/signin_page_screen.dart';
import 'package:blog_app/screen/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 2),
            () async{
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

          if(sharedPreferences.getString("token") != null){

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageScreen()));

          } else {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SigninPageScreen()));

          }

            }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
              height: height * 0.30,
            ),

            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[400],
              ),
              child: Icon(
                Icons.menu_book,
                color: Color(0xff4AA4D6),
                size: 90,
              ),
            ),

            SizedBox(
              height: height * 0.02,
            ),

            Text(
              "Blog App",
              style: TextStyle(
                color: Color(0xff4AA4D6),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: height * 0.2,
            ),

            SpinKitThreeInOut(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Color(0xff4AA4D6) : Colors.white,
                    shape: BoxShape.circle,
                  ),
                );
              },
            ),

            SizedBox(
              height: height * 0.030,
            ),

            Text(
              "Design & Deveoped By",
              style: TextStyle(
                color: Color(0xff4AA4D6),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Foysal Joarder",
              style: TextStyle(
                color: Color(0xff4AA4D6),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
