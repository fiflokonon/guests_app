import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Photo with ChangeNotifier {

  
  static String url = "http://first.banjoocash.com";

   Future <Map> add_profile_photo(
      {
      required String id,
      required String source,

      }) async{
        try {
      final response = await http.post(
        Uri.parse('$url/users/$id/photos'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        encoding: Encoding.getByName("utf-8"),
        body: json.encode({
							"mode": "formdata",
							"formdata": [
								{
									"key": "file",
									"type": "file",
									"src": source
								}
							]
						}),
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      Map data = {
        "error": responseData['error'],
        "message": responseData['message']
      };
      return data;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

  Future <Map> get_user_photos(
      {
      required String id,
      required String source,

      }) async{
        try {
      final response = await http.get(
        Uri.parse('$url/users/$id/photos'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      Map data = {
        "error": responseData['error'],
        "message": responseData['message']
      };
      return data;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

   Future <Map> get_user_active_photo(
      {
      required String id,

      }) async{
        try {
      final response = await http.get(
        Uri.parse('$url/users/$id/active-photo'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      Map data = {
        "error": responseData['error'],
        "message": responseData['message']
      };
      return data;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }
    
    Future <Map> get_All_Photos() async{
        try {
      final response = await http.get(
        Uri.parse('$url/photos'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      Map data = {
        "error": responseData['error'],
        "message": responseData['message']
      };
      return data;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

    Future <Map> get_A_photo(
      {
      required String id,

      }) async{
        try {
      final response = await http.get(
        Uri.parse('$url/photos/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      Map data = {
        "error": responseData['error'],
        "message": responseData['message']
      };
      return data;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

      Future <Map> delete_photo(
      {
      required String id,

      }) async{
        try {
      final response = await http.delete(
        Uri.parse('$url/photos/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        encoding: Encoding.getByName("utf-8"),
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      Map data = {
        "error": responseData['error'],
        "message": responseData['message']
      };
      return data;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

}