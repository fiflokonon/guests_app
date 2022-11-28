import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models.dart/events.dart';
class EventController with ChangeNotifier{
  String authToken;
  List<Event> _items = [];
  List<Event> _currentItems = [];
  List<Event> _pastItems = [];
  List<Event> _futureItems = [];
  // late String _addmessage = "";
  // late bool _addError = false;
  List<Event> get items {
    return _items;
  }
  List<Event> get currentItems {
    return _currentItems;
  }
  List<Event> get pastItems {
    return _pastItems;
  }
  List<Event> get futureItems {
    return _futureItems;
  }
  EventController(this.authToken, this._items, this._currentItems, this._futureItems, this._pastItems
      // , this._user
      );
  
  static String url = "http://first.banjoocash.com/api";

  Future <List<Event>> events_list() async{
  try {
          print("token ======== $authToken");
      final response = await http.get(
        Uri.parse('$url/events'),
        headers: {
          // 'Content-Type': 'application/json',
          // 'Accept': 'application/json',
          "Authorization": "Bearer $authToken"
        },
      );
      final responseData = json.decode(response.body);
      print("======event list ======= $responseData");
      List<Event> events = [];
      for (var event in responseData) {
        // create event
        events.add(Event(
        id: event['id'], 
        titre: event['titre'], 
        slogan: event['slogan'], 
        description: event['description'], 
        lieu: event['lieu'], 
        date_de_debut: event['date_de_debut'], 
        date_de_fin: event['date_de_fin'], 
        id_utilisateur: event['id_utilisateur'], 
        created_at: event['created_at']));
        // add event
        // _items.add(data);
      }
      _items = events;
      notifyListeners();
      // {
      //   "error": responseData['error'],
      //   "message": responseData['message']
      // };
      return _items;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

  Future <bool> create_Event({required String idUser,required String titre,required String slogan,required String description,required String lieu,required String date_de_debut,required String date_de_fin,}) async{try {
          print(authToken);
      final response = await http.post(
        Uri.parse('$url/users/$idUser/events'),
        headers: {
          // 'Content-Type': 'application/json',
          // 'Accept': 'application/json',
          'Authorization': 'Bearer $authToken'
        },
        // encoding: Encoding.getByName("utf-8"),
        body: {
          "titre": titre,
          "slogan": slogan,
          "description": description,
          "lieu": lieu,
          "date_de_debut": date_de_debut,
          "date_de_fin": date_de_fin,
        },
      );
      final responseData = json.decode(response.body);
      print("==create event=== $responseData");
      Event event = Event(
        id: responseData[0]['id'], 
        titre: responseData[0]['titre'], 
        slogan: responseData[0]['slogan'], 
        description: responseData[0]['description'], 
        lieu: responseData[0]['lieu'], 
        date_de_debut: responseData[0]['date_de_debut'], 
        date_de_fin: responseData[0]['date_de_fin'], 
        id_utilisateur: responseData[0]['id_utilisateur'], 
        created_at: responseData[0]['created_at']);
      // Map data = {
      //   "error": responseData['error'],
      //   "message": responseData['message']
      // };
      _items.add(event);
      notifyListeners();
      return true;
    } catch (error) {
      print("*** error $error");
      return false;
    }
      }
  
  Future <List<Event>> get_User_Events_List({required int id}) async{
        try {
      final response = await http.get(
        Uri.parse('$url/users/$id/events'),
        headers: {
          "Authorization": "Bearer $authToken"
        },
      );
      final responseData = json.decode(response.body);
      print("===== user event list");
      List<Event> events = [];
      for (var event in responseData) {
        // create event
        events.add(Event(
        id: event['id'], 
        titre: event['titre'], 
        slogan: event['slogan'], 
        description: event['description'], 
        lieu: event['lieu'], 
        date_de_debut: event['date_de_debut'], 
        date_de_fin: event['date_de_fin'], 
        id_utilisateur: event['id_utilisateur'], 
        created_at: event['created_at']));
        // add event
        // _items.add(data);
      }
      _items = events;
      notifyListeners();
      return _items;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

  Future <Event> get_Event({required String idEvent}) async{
        try {
      final response = await http.get(
        Uri.parse('$url/events/$idEvent'),
        headers: {
          "Authorization": "Bearer $authToken"
        },
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
        Event event = Event(
        id: responseData['id'], 
        titre: responseData['titre'], 
        slogan: responseData['slogan'], 
        description: responseData['description'], 
        lieu: responseData['lieu'], 
        date_de_debut: responseData['date_de_debut'], 
        date_de_fin: responseData['date_de_fin'], 
        id_utilisateur: responseData['id_utilisateur'], 
        created_at: responseData['created_at']);
        return event;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

Future <Map> delete_Event({required String id}) async{
        try {
      final response = await http.delete(
        Uri.parse('$url/events/$id'),
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

Future <Map> today_Events() async{
        try {
      final response = await http.get(
        Uri.parse('$url/today-events'),
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

Future <List<Event>> past_events(String id) async{
    try {
      final response = await http.get(
        Uri.parse('$url/users/$id/past-events'),
        headers: {
          "Authorization": "Bearer $authToken"
        },
      );
      final responseData = json.decode(response.body);
      print("===== user event list");
      List<Event> events = [];
      for (var event in responseData) {
        // create event
        events.add(Event(
        id: event['id'], 
        titre: event['titre'], 
        slogan: event['slogan'], 
        description: event['description'], 
        lieu: event['lieu'], 
        date_de_debut: event['date_de_debut'], 
        date_de_fin: event['date_de_fin'], 
        id_utilisateur: event['id_utilisateur'], 
        created_at: event['created_at']));
        // add event
        // _items.add(data);
      }
      _pastItems = events;
      notifyListeners();
      return _items;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

  Future <List<Event>> coming_events(id) async{
    try {
      final response = await http.get(
        Uri.parse('$url/users/$id/events'),
        headers: {
          "Authorization": "Bearer $authToken"
        },
      );
      final responseData = json.decode(response.body);
      print("===== user event list");
      List<Event> events = [];
      for (var event in responseData) {
        // create event
        events.add(Event(
        id: event['id'], 
        titre: event['titre'], 
        slogan: event['slogan'], 
        description: event['description'], 
        lieu: event['lieu'], 
        date_de_debut: event['date_de_debut'], 
        date_de_fin: event['date_de_fin'], 
        id_utilisateur: event['id_utilisateur'], 
        created_at: event['created_at']));
        // add event
        // _items.add(data);
      }
      _futureItems = events;
      notifyListeners();
      return _items;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

  Future <List<Event>> user_Past_Events({required String id}) async{
      try {
      final response = await http.get(
        Uri.parse('$url/users/$id/past-events'),
        headers: {
          "Authorization": "Bearer $authToken"
        },
      );
      final responseData = json.decode(response.body);
      print("===== user event list");
      List<Event> events = [];
      for (var event in responseData) {
        // create event
        events.add(Event(
        id: event['id'], 
        titre: event['titre'], 
        slogan: event['slogan'], 
        description: event['description'], 
        lieu: event['lieu'], 
        date_de_debut: event['date_de_debut'], 
        date_de_fin: event['date_de_fin'], 
        id_utilisateur: event['id_utilisateur'], 
        created_at: event['created_at']));
        // add event
        // _items.add(data);
      }
      _pastItems = events;
      notifyListeners();
      return _pastItems;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

Future <List<Event>> user_Coming_Events({required String id}) async{
      try {
      final response = await http.get(
        Uri.parse('$url/users/$id/coming-events'),
        headers: {
          "Authorization": "Bearer $authToken"
        },
      );
      final responseData = json.decode(response.body);
      print("===== user event list");
      List<Event> events = [];
      for (var event in responseData) {
        // create event
        events.add(Event(
        id: event['id'], 
        titre: event['titre'], 
        slogan: event['slogan'], 
        description: event['description'], 
        lieu: event['lieu'], 
        date_de_debut: event['date_de_debut'], 
        date_de_fin: event['date_de_fin'], 
        id_utilisateur: event['id_utilisateur'], 
        created_at: event['created_at']));
        // add event
        // _items.add(data);
      }
      _futureItems = events;
      notifyListeners();
      return _futureItems;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }


   Future <List<Event>> user_Today_Events({required String id}) async{
      try {
      final response = await http.get(
        Uri.parse('$url/users/$id/today-events'),
        headers: {
          "Authorization": "Bearer $authToken"
        },
      );
      final responseData = json.decode(response.body);
      print("===== user event list");
      List<Event> events = [];
      for (var event in responseData) {
        // create event
        events.add(Event(
        id: event['id'], 
        titre: event['titre'], 
        slogan: event['slogan'], 
        description: event['description'], 
        lieu: event['lieu'], 
        date_de_debut: event['date_de_debut'], 
        date_de_fin: event['date_de_fin'], 
        id_utilisateur: event['id_utilisateur'], 
        created_at: event['created_at']));
        // add event
        // _items.add(data);
      }
      _currentItems = events;
      notifyListeners();
      return _currentItems;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
      }

}