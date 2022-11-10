import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models.dart/user.dart';
class Auth with ChangeNotifier{

  static String url = "http://first.banjoocash.com";
  final String _token = "";
  User? _user;

  User get user {return _user!;}
  String get token {return _token;}

  Future <Map> register(
      {required String lastname,
      required String firstname,
      required String sexe,
      required int contact,
      required String email,
      required String password}) async{
        try {
      final response = await http.post(
        Uri.parse('$url/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        encoding: Encoding.getByName("utf-8"),
        body: json.encode({
          "email": email,
          "contact": contact,
          "sexe": sexe,
          "lastname": lastname,
          "firstname": firstname,
          "password": password,
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

  Future <Map> login(
      {
      required String email,
      required String password
      }) async{
        try {
      final response = await http.post(
        Uri.parse('$url/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        encoding: Encoding.getByName("utf-8"),
        body: json.encode({
          "email": email,
          "password": password,
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

    Future <Map> get_all_users() async{
        try {
      final response = await http.get(
        Uri.parse('$url/users'),
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

      Future <Map> change_User_Status(
      {
      required String id,
      required String lastname,
      required String firstname,
      required String sexe,
      required int contact,
      required String email,
      required String password}) async{
        try {
      final response = await http.put(
        Uri.parse('$url/users/$id/change-status'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        encoding: Encoding.getByName("utf-8"),
        // body: json.encode({
        //   "email": email,
        //   "password": password,
        // }),
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

  Future <Map> delete_Users(
      {required String id,}) async{
        try {
      final response = await http.delete(
        Uri.parse('$url/users/$id/delete'),
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
  
    Future <Map> edit_Users(
      {required String id,
      required String lastname,
      required String firstname,
      required String sexe,
      required int contact,
      required String email,
      required String password}) async{
        try {
      final response = await http.put(
        Uri.parse('$url/users/$id/edit'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        encoding: Encoding.getByName("utf-8"),
        body: json.encode({
          "email": email,
          "contact": contact,
          "sexe": sexe,
          "lastname": lastname,
          "firstname": firstname,
          "password": password,
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

  Future <Map> get_A_User(
      {required String id}) async{
        try {
      final response = await http.get(
        Uri.parse('$url/users/$id'),
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
  
  Future <Map> get_Me(
      {required String token}) async{
        try {
      final response = await http.get(
        Uri.parse('$url/users/me'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Bearer': token,
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
}