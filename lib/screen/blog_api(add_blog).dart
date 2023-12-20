import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BlogApi with ChangeNotifier{
  static String apiUrl = 'https://apitest.smartsoft-bd.com/api/admin/blog-news/store';

  static Future<void> createBlogPost({
    required String title,
    required String subTitle,
    required String slug,
    required String description,
    required int categoryId,
    required DateTime date,
    required List<String> tags,
  }) async {
    final Map<String, dynamic> postData = {
      'title': title,
      'sub_title': subTitle,
      'slug': slug,
      'description': description,
      'category_id': categoryId,
      'date': date.toIso8601String(),
      //'date': DateTime.now(),
      'tags': tags,
    };

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization" : "Bearer $token",
      },
      body: jsonEncode(postData),
    );


  if (response.statusCode == 200) {
      print('Blog post created successfully');
     // print('Response: ${response.body}');
    } else {
      print('Failed to create blog post');
      print('Status Code: ${response.statusCode}');
     // print('Response: ${response.body}');
    }

  }

}