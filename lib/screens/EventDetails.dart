import 'package:flutter/material.dart';
import 'package:guests/controllers/events.dart';
import 'package:guests/screens/CreatInvitation.dart';
import 'package:guests/screens/Invitations.dart';
import 'package:guests/screens/statistique.dart';
import 'package:guests/widgets/ButtonWidget.dart';
import 'package:provider/provider.dart';

import '../models.dart/events.dart';

class EventDetails extends StatefulWidget {
  final int eventId;
  const EventDetails({super.key, required this.eventId});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    Event event = Provider.of<EventController>(context, listen: true)
        .items
        .where((element) => element.id == widget.eventId)
        .first;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xFF19173D),
        leading: IconButton(
            onPressed: () {
              //Back
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          "Evénement",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
          ),
        ),
        actions: [
          PopupMenuButton(
              color: const Color(0xFF19173D),
              itemBuilder: ((context) => [
                    PopupMenuItem(
                        child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return CreateInvitation(eventId: event.id,);
                                  }),
                                ),
                            child: const Text(
                              "Ajouter une invitation",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ))
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: [
                        const Icon(
                          Icons.list_alt,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () => Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return  Invitations(eventId: event.id,);
                                })),
                            child: const Text("Les invitations",
                                style: TextStyle(
                                  color: Colors.white,
                                ))),
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Editer l'événement",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
                  ]))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  event.titre,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Oleo_Script",
                      fontSize: 24),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10)),
                  width: 80,
                  height: 5,
                ),
              ),
              Image.asset(
                "assets/images/image_3.png",
                height: 200,
                width: 200,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  event.description,
                  style:
                      const TextStyle(color: Colors.white, fontFamily: "Poppins"),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Debut: ${event.date_de_debut.substring(0, 10)}",
                    style: const TextStyle(
                        color: Color.fromRGBO(123, 120, 170, 1),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                  Text(
                    "Heure: ${event.date_de_debut.substring(10, 16)}",
                    style: const TextStyle(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Fin: ${event.date_de_debut.substring(0, 10)}",
                    style: const TextStyle(
                        color: Color.fromRGBO(123, 120, 170, 1),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Heure: ${event.date_de_debut.substring(10, 16)}",
                    style: const TextStyle(
                        color: Color.fromRGBO(123, 120, 170, 1),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                text: "Voir les statistiques",
                tap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Statistique();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
