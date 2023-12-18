
import 'package:blog_app/provider/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {


  @override
  Widget build(BuildContext context) {

    var authServices = Provider.of<AuthServices>(context, listen: false);

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
    );
  }
}
