import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BlogApi2 with ChangeNotifier{
  static const String apiUrl = 'https://apitest.smartsoft-bd.com/api/admin/blog-news/update/';

  static Future<void> updateBlogPost({
    required int postId,
    String? title,
    String? subTitle,
    String? slug,
    String? description,
    int? categoryId,
    DateTime? date,
    List<String>? tags,
  }) async {
    // Create a map to hold the fields that need to be updated
    Map<String, dynamic> updatedFields = {};

    if (title != null) updatedFields['title'] = title;
    if (subTitle != null) updatedFields['sub_title'] = subTitle;
    if (slug != null) updatedFields['slug'] = slug;
    if (description != null) updatedFields['description'] = description;
    if (categoryId != null) updatedFields['category_id'] = categoryId;
    if (date != null) updatedFields['date'] = date.toIso8601String();
    if (tags != null) updatedFields['tags'] = tags;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");

    // Send the update request to the API
    final response = await http.post(
      Uri.parse('$apiUrl${postId}'), // Assuming the API endpoint includes the post ID
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization" : "Bearer $token",
      },
      body: jsonEncode(updatedFields),
    );

    if (response.statusCode == 200) {
      print('Blog post updated successfully');
      print('Response: ${response.body}');
    } else {
      print('Failed to update blog post');
      print('Status Code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }
}
