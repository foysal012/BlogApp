import 'package:blog_app/provider/auth_services.dart';
import 'package:blog_app/provider/blog_list_services.dart';
import 'package:blog_app/screen/add_new_blog.dart';
import 'package:blog_app/screen/blog_api(add_blog).dart';
import 'package:blog_app/screen/blog_api2(update_blog).dart';
import 'package:blog_app/screen/blog_api3(delete_blog).dart';
import 'package:blog_app/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> AuthServices()),
          ChangeNotifierProvider(create: (context)=> BlogListServices()),
          ChangeNotifierProvider(create: (context)=> BlogApi()),
          ChangeNotifierProvider(create: (context)=> BlogApi2()),
          ChangeNotifierProvider(create: (context)=> BlogApi3()),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        //home: AddNewBlog(),
      ),
    );
  }
}

