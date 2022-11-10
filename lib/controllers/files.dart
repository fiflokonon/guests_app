import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Files with ChangeNotifier{

  static String url = "http://first.banjoocash.com";
  static String path = "";

   Future <Map> get_Files() async{
        try {
      final response = await http.get(
        Uri.parse('$url/files'),
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


Future <Map> add_File(
      {
        required String id,
        required String source
      }) async{
        try {
      final response = await http.post(
        Uri.parse('$url/events/$id/files'),
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
						},),
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


   Future <Map> event_Files({required String id}) async{
        try {
      final response = await http.get(
        Uri.parse('$url/events/$id/files'),
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

  Future <Map> delete_File({required String id}) async{
        try {
      final response = await http.delete(
        Uri.parse('$url/files/$id'),
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

  Future <Map> get_File({required String id}) async{
        try {
      final response = await http.delete(
        Uri.parse('$path/files/$id'),
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