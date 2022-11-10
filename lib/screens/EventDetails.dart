import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guests/widgets/ButtonWidget.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFF19173D),
        leading: IconButton(
            onPressed: () {
              //Back
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
              color: Color(0xFF19173D),
              itemBuilder: ((context)=>[
              PopupMenuItem(child: Row(children: [Icon(Icons.add,color: Colors.white,), SizedBox(width: 5,), Text("Ajouter une invitation", style: TextStyle(color: Colors.white,),)],)),
              PopupMenuItem(child: Row(children: [Icon(Icons.list_alt,color: Colors.white,), SizedBox(width: 5,), Text("Les invitations", style: TextStyle(color: Colors.white,)),],)),
              PopupMenuItem(child: Row(children: [Icon(Icons.edit ,color: Colors.white,), SizedBox(width: 5,), Text("Editer l'événement", style: TextStyle(color: Colors.white,),)],)),

        ]))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Titre de l'événement",
                style: TextStyle(
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
              child: const Text(
                "Description de l'événement",
                style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
            const SizedBox(
              height: 50,
            ),
            const ButtonWidget(text: "Voir les statistiques")
          ],
        ),
      ),
    );
  }
}
