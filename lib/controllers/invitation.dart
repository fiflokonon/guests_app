import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guests/models.dart/invitations.dart';
import 'package:http/http.dart' as http;

class InvitationController with ChangeNotifier {
String authToken;
  List<Invitation> _items = [];
  // late String _addmessage = "";
  // late bool _addError = false;
  List<Invitation> get items {
    return _items;
  }
  InvitationController(this.authToken, this._items
      // , this._user
      );
  
  static String url = "http://first.banjoocash.com/api";

    Future <List <Invitation>> get_All_Invitations() async{try {
      final response = await http.get(
        Uri.parse('$url/invitations-list'),
        headers: {          
          "Authorization": "Bearer $authToken"
        },
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      List <Invitation> invitationList = [];
      for (var invitation in responseData) {
        invitationList.add(Invitation(
          id: invitation['id'], 
          id_evenement: invitation["id_evenement"], 
          place: invitation["place"], 
          retour: invitation["retour"], 
          statut_envoye: invitation["statut_envoye"], 
          nom_prenoms: invitation["nom_prenoms"], 
          lien_carte: invitation["lien_carte"].toString(), 
          lien_code: invitation["lien_code"], 
          created_at: invitation["created_at"]));
      }
      _items = invitationList;
      notifyListeners();
      return _items;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

Future <bool> create_Invitation({required String idEvent,required String nom_prenoms,required int place}) async{
        try {
      final response = await http.post(
        Uri.parse('$url/events/$idEvent/invitations'),
        headers: {
          "Authorization": "Bearer $authToken"
        },
        // encoding: Encoding.getByName("utf-8"),
        body: {
          "nom_prenoms": nom_prenoms,
          "place": "$place",
        },
      );
      final invitation = json.decode(response.body);
      print("===== $invitation");
      try {
        Invitation data = Invitation(
          id: invitation[0]['id'], 
          id_evenement: invitation[0]["id_evenement"], 
          place: invitation[0]["place"], 
          retour: invitation[0]["retour"], 
          statut_envoye: invitation[0]["statut_envoye"], 
          nom_prenoms: invitation[0]["nom_prenoms"], 
          lien_carte: invitation[0]["lien_carte"].toString(), 
          lien_code: invitation[0]["lien_code"], 
          created_at: invitation[0]["created_at"]);
          _items.add(data);
          notifyListeners();
      return true;
      } catch (e) {
        return false;
      }
    } catch (error) {
      print("*** error $error");
      return false;
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

Future <List<Invitation>> event_Invitations({required String idEvent}) async{
        try {
      final response = await http.get(
        Uri.parse('$url/events/$idEvent/invitations'),
        
        headers: {          
          "Authorization": "Bearer $authToken"
        },
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      List <Invitation> invitationList = [];
      for (var invitation in responseData) {
        invitationList.add(Invitation(
          id: invitation['id'], 
          id_evenement: invitation["id_evenement"], 
          place: invitation["place"], 
          retour: invitation["retour"], 
          statut_envoye: invitation["statut_envoye"], 
          nom_prenoms: invitation["nom_prenoms"], 
          lien_carte: invitation["lien_carte"].toString(), 
          lien_code: invitation["lien_code"], 
          created_at: invitation["created_at"]));
      }
      _items = invitationList;
      notifyListeners();
      return _items;
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