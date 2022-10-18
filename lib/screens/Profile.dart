import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/ListileWidget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List paramList = [
    {"icon": Icons.abc, "title": "Notifications"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        /*title: const Text("Profil", 
        style: TextStyle(
          fontFamily: "Poppins", 
          fontSize: 25,
        ),),*/
        leading: IconButton(
            onPressed: (() {
              ///
            }),
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            )),
        elevation: 0.0,
        backgroundColor: const Color(0xFF19173D),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(150),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/logo.png")))),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Arnaud LOKONON",
                  style: TextStyle(
                      color: Color.fromARGB(255, 194, 194, 206),
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFF262450),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  ListileWigdet(
                    text: 'Notifications',
                    iconData: Icons.notifications,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListileWigdet(text: 'Profil',
                  iconData: Icons.person,),
                  SizedBox(
                    height: 5,
                  ),
                  ListileWigdet(text: "A propos", 
                  iconData: Icons.info_outline_rounded),
                  SizedBox(
                    height: 5,
                  ),
                  ListileWigdet(text: "Aide", 
                  iconData: Icons.help_center),
                  SizedBox(
                    height: 5,
                  ),
                  ListileWigdet(text: "Déconnexion",
                   iconData: Icons.logout)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

