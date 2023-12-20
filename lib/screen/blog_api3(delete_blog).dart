import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BlogApi3 with ChangeNotifier {
  static const String apiUrl = 'https://apitest.smartsoft-bd.com/api/admin/blog-news/delete/';

  static Future<void> deleteBlogPost(int postId) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    print("foysal : ${token}");
    print("foysal : ${postId}");

    final response = await http.delete(
      Uri.parse(apiUrl+"${postId}"), // Assuming the API endpoint includes the post ID
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization" : "Bearer $token",
      },

    );

    print("foysal : ${response.statusCode}");

    if (response.statusCode == 200) {
      print('Blog post deleted successfully');
      print('Response: ${response.body}');
      //BlogListServices().getAllBlog();

    } else {
      print('Failed to delete blog post');
      print('Status Code: ${response.statusCode}');
      print('Response: ${response.body}');
    }

  }


}