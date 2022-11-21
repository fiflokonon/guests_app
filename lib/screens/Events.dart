import 'package:flutter/material.dart';
import 'package:guests/screens/EventDetails.dart';
import 'package:provider/provider.dart';

import '../controllers/events.dart';
import '../models.dart/events.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19173D),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Mes événements",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              //Back
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            )),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
          future:
              Provider.of<EventController>(context, listen: true).events_list(),
          initialData:
              Provider.of<EventController>(context, listen: true).items,
          builder: (context, snapshot) {
            List<Event> data =
                Provider.of<EventController>(context, listen: false).items;
            return data.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EventDetails(
                                key: ValueKey(data[index].id),
                                eventId: data[index].id);
                          }));
                        }),
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          margin: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(38, 36, 80, 1),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 104, 98, 199),
                                    offset: Offset(-2, 2),
                                    blurRadius: 8.0,
                                    spreadRadius: 2.5,
                                    blurStyle: BlurStyle.normal),
                              ]),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  data[index].titre,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      fontFamily: "Oleo_Script",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Text(
                                          data[index].description,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.87),
                                              fontFamily: "Poppins"),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Image.asset(
                                          "assets/images/image_3.png"),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: const [
                                  Text(
                                    "Debut: 17/52/25",
                                    style: TextStyle(
                                        color: Color.fromRGBO(123, 120, 170, 1),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins"),
                                  ),
                                  Text(
                                    "Heure: 14:20",
                                    style: TextStyle(
                                        color: Color.fromRGBO(123, 120, 170, 1),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: const [
                                  Text(
                                    "Fin: 17/52/25",
                                    style: TextStyle(
                                        color: Color.fromRGBO(123, 120, 170, 1),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Heure: 14:00",
                                    style: TextStyle(
                                        color: Color.fromRGBO(123, 120, 170, 1),
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(32, 49, 92, 1),
        onPressed: () =>
            Provider.of<EventController>(context, listen: false).events_list(),
        // Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) {
        //                 return const CreatEvent();
        //               })),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor:
                  const Color.fromARGB(255, 70, 66, 131).withOpacity(0.5)),
          child: BottomNavigationBar(
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
                    icon: Icon(Icons.settings), label: "Settings"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profil"),
              ])),
    );
  }
}
