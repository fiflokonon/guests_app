import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:guests/models.dart/presence.dart';
import 'package:http/http.dart' as http;

class PresenceController with ChangeNotifier {
  String authToken;
  final List<PresenceModel> _items;
  List<PresenceModel> get items {
    return _items;
  }

  PresenceController(this.authToken, this._items);

  static String url = "http://first.banjoocash.com/api";

  Future<PresenceModel> get_invitation_infos({required String qr}) async {
    try {
      final response = await http.get(
        Uri.parse("$url/invitations-list/$qr/infos"),
        headers: {"Authorization": "Bearer $authToken"},
      );
      print("++++++++++++++++++++${response.request}");
      Map responseData = json.decode(response.body) as Map;
      print("===== $responseData");
      PresenceModel infos = PresenceModel(
        nomPrenoms: responseData["response"]['nom_prenoms'],
        placeOccupe: responseData["response"]['place_occupe'],
        placeDispo: responseData["response"]['place_dispo'],
        placeRest: responseData["response"]['place_rest'],
        invitationId: responseData["response"]['invitation_id'],
        eventTitle:  responseData["response"]['event_title'],
      );
      return infos;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
  }

  Future<Map> get_event_stats({required String event}) async {
    try {
      final response = await http.get(
        Uri.parse('$url/events/$event/stats'),
        headers: {"Authorization": "Bearer $authToken"},
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      print("${responseData['response']['nb_presents']}");      
      if(responseData["success"]){
      Map stats = {
        "eventTitle": responseData['response']['event_title'],
        "nbPresents": responseData['response']['nb_presents'],
        "nbAbsent": responseData['response']['nb_absent'],
        "nbInvites": responseData['response']['nb_invites']
      };
      return {"success" : true, "data":stats};
      }else{
        return {"success" : false, "message":responseData["message"]};
      }
    } catch (error) {
      print("*** error $error");
      
      return {"success" : false, "message":"Un problème est survenu. Reessayez svp"};
    }
  }

  Future<Map> get_event_presence({required String event}) async {
    try {
      final response = await http.get(
        Uri.parse('$url/events/$event/presences'),
        headers: {"Authorization": "Bearer $authToken"},
      );
      final responseData = json.decode(response.body);  
      print("==get event presence=== $responseData");
      List <PresenceModel> presence = [];
      if(responseData["success"]){
      for (Map element  in responseData["response"].values) {
        PresenceModel present = PresenceModel(
        nomPrenoms: element['nom_prenoms'],
        placeOccupe: element['place_occupe'],
        placeDispo: element['place_dispo'],
        placeRest: element['place_rest'],
        invitationId: responseData['invitation_id']??1, eventTitle: element['event_title']??'',
        
      );
      presence.add(present);
      }
      return {"success" : true, "data":presence};
      }else{
        return {"success" : false, "message":responseData["message"]};
      }
    } catch (error) {
      print("*** error $error");
      return {"success" : false, "message":"Un problème est survenu. Reessayez svp"};
    }
  }

    Future <Map> createPresence({required String invitation,required String place,}) async{try {
      print("la place est _ç____________________________ $place");
      final response = await http.post(
        Uri.parse('$url/invitations-list/$invitation/presences'),
        headers: {
          // 'Content-Type': 'application/json',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer $authToken'
        },
        // encoding: Encoding.getByName("utf-8"),
        body: {
          "place": place,
        },
      );
      final responseData = json.decode(response.body);
      print("==create presence=== $responseData");
      if(responseData["success"]){
      PresenceModel present = PresenceModel(
        nomPrenoms: responseData["response"]['nom_prenoms'],
        placeOccupe: responseData["response"]['place_occupe'],
        placeDispo: responseData["response"]['place_dispo'],
        placeRest: responseData["response"]['place_rest'],
        invitationId: responseData["response"]['invitation_id'],        
        eventTitle:  responseData["response"]['event_title'],);
      return {"success" : true, "message":"Presence marquée avec succes"};
      }else{
        return {"success" : false, "message":responseData["message"]};
      }
    } catch (error) {
      print("*** error $error");
      return {"success" : false, "message":"Un problème est survenu. Reessayez svp"};
    }
      }
}
