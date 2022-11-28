import 'package:flutter/material.dart';
import 'package:guests/screens/events/eventsFiltre.dart';

import 'Notifications.dart';
import 'Profile.dart';
import 'events/CreatEvent.dart';
import 'qrScreen.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}
List screen = [
  const EventsFiltre(),const Notifs(),const QrScreen(),const Profile()
];
class _ScreenState extends State<Screen> {
    int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentScreen],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(32, 49, 92, 1),
        onPressed: () =>
            // Provider.of<EventController>(context, listen: false).events_list(),
        Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                        return const CreatEvent();
                      })),
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor:
                  const Color.fromARGB(255, 70, 66, 131).withOpacity(0.5)),
          child: BottomNavigationBar(
            currentIndex: currentScreen,
            onTap: (value) => setState(() {
              print(currentScreen);
              currentScreen = value;
            }),
              elevation: 1,
              backgroundColor: const Color.fromARGB(255, 53, 43, 241),
              fixedColor: const Color.fromARGB(255, 21, 190, 182),
              selectedIconTheme: const IconThemeData(shadows: [
                Shadow(
                    color: Color.fromARGB(255, 21, 190, 182),
                    offset: Offset(-2, 2),
                    blurRadius: 15.0),
                Shadow(
                    color: Color.fromARGB(255, 21, 190, 182),
                    offset: Offset(2, -2),
                    blurRadius: 15.0)
              ]),
              selectedLabelStyle: const TextStyle(shadows: [
                Shadow(
                    color: Color.fromARGB(255, 21, 190, 182),
                    offset: Offset(-2, 2),
                    blurRadius: 15.0),
                Shadow(
                    color: Color.fromARGB(255, 21, 190, 182),
                    offset: Offset(2, -2),
                    blurRadius: 15.0)
              ]),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: "Notif"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code), label: "Qr Scan"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profil"),
              ])),
    );
  }
}