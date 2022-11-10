import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Invitation with ChangeNotifier {

  static String url = "http://first.banjoocash.com";

    Future <Map> get_All_Invitations() async{
        try {
      final response = await http.get(
        Uri.parse('$url/invitations-list'),
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

Future <Map> create_Invitation(
      {
        required String id,
        required String nom_prenoms,
      required int place
      }) async{
        try {
      final response = await http.post(
        Uri.parse('$url/events/$id/invitations'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        encoding: Encoding.getByName("utf-8"),
        body: json.encode({
          "nom_prenoms": nom_prenoms,
          "place": place,
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


    Future <Map> get_Invitation({required String id}) async{
        try {
      final response = await http.get(
        Uri.parse('$url/invitations/$id'),
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

Future <Map> event_Invitations({required String id}) async{
        try {
      final response = await http.get(
        Uri.parse('$url/events/$id/invitations'),
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

  Future <Map> delete_Invitation({required String id}) async{
        try {
      final response = await http.delete(
        Uri.parse('$url/invitations/$id'),
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