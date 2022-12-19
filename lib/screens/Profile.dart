
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guests/screens/auth/Login.dart';
import 'package:provider/provider.dart';

import '../controllers/auth.dart';
import '../models.dart/user.dart';
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
    User user = Provider.of<AuthController>(context, listen: false).user;
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
                      color: const Color(0xFF19173D),
                      border: Border.all(color:  Colors.white),
                      borderRadius: BorderRadius.circular(100),),
                  child: CircleAvatar(backgroundColor: const Color(0xFF19173D),
                    child: SvgPicture.network(
                        "https://visualpharm.com/assets/387/Person-595b40b75ba036ed117da139.svg",
                        height: 100,width: 100,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${user.prenoms} ${user.nom}",
                  style: const TextStyle(
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
                children:  [
                  const SizedBox(
                    height: 30,
                  ),
                  const ListileWigdet(
                    text: 'Notifications',
                    iconData: Icons.notifications,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // ListileWigdet(text: 'Profil',
                  // iconData: Icons.person,),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  const ListileWigdet(
                      text: "A propos", iconData: Icons.info_outline_rounded),
                  const SizedBox(
                    height: 5,
                  ),
                  const ListileWigdet(text: "Aide", iconData: Icons.help_center),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () =>                       
                      Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(builder: (context) {
              return const Login();
            }),
                          (route) => false)
                    ,
                    child: const ListileWigdet(text: "Déconnexion", iconData: Icons.logout))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
