import 'package:flutter/material.dart';
import 'package:guests/screens/CreatEvent.dart';
import 'package:guests/screens/CreatInvitation.dart';
import 'package:guests/screens/EventDetails.dart';
import 'package:guests/screens/Events.dart';
import 'package:guests/screens/InvitationDetails.dart';
import 'package:guests/screens/Invitations.dart';
import 'package:guests/screens/Login.dart';
import 'package:guests/screens/Notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guests',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          scaffoldBackgroundColor: const Color(0xFF19173D)
        ),
      home:const Events(),
    );
  }
}
