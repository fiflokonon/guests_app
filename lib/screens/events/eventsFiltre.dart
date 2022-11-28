import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth.dart';
import '../../controllers/events.dart';
import '../../models.dart/events.dart';
import '../../models.dart/user.dart';
import 'EventDetails.dart';

class EventsFiltre extends StatelessWidget {
  const EventsFiltre({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<AuthController>(context, listen: false).user;
    return DefaultTabController(length: 3, child:Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xFF19173D),
        // leading: IconButton(
        //     onPressed: () {
        //       //Back
        //     },
        //     icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          "Mes Events",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
          ),
        ),
        bottom:  
          const TabBar(tabs: [
            Tab(child: Text("Passé")),
            Tab(child: Text("Du Jour")),
            Tab(child: Text("Prochain"))
          ]),
      ),
      body:  
      TabBarView(children: [
        EventListScreen(user: user, 
        future:Provider.of<EventController>(context, listen: false).user_Past_Events(id: "${user.id}"),
        initialValue: Provider.of<EventController>(context, listen: false).pastItems),
        EventListScreen(user: user,
        future:Provider.of<EventController>(context, listen: false).user_Today_Events(id: "${user.id}"),
        initialValue: Provider.of<EventController>(context, listen: false).currentItems),
        EventListScreen(user: user,
        future:Provider.of<EventController>(context, listen: false).user_Coming_Events(id: "${user.id}"),
        initialValue: Provider.of<EventController>(context, listen: false).futureItems),

      ]) )
    );
  }
}

class EventListScreen extends StatelessWidget {
  const EventListScreen({
    Key? key,
    required this.user, required this.future,required this.initialValue
  }) : super(key: key);

  final User user;
  final Future<List<Event>> future ;
  final List<Event> initialValue;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          future,
      initialData:
          initialValue,
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            :snapshot.data!.isEmpty ? const Center(child: Text("Pas de donnée"),) : ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Provider.of<EventController>(context, listen: false).get_User_Events_List(id: user.id);
                  return EventSelect(key:ValueKey(snapshot.data![index].id),
                    data: snapshot.data![index]);
                });
      });
  }
}

class EventSelect extends StatelessWidget {
  const EventSelect({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Event data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
          return EventDetails(
              key: ValueKey(data.id),
              event : data);
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
                data.titre,
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
                        data.description,
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
              children:  [
                Text(
                  "Debut:  ${data.date_de_debut.substring(0, 10)}",
                  style: const TextStyle(
                      color: Color.fromRGBO(123, 120, 170, 1),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"),
                ),
                Text(
                  "Heure: ${data.date_de_debut.substring(10, 16)}",
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
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children:  [
                Text(
                  "Fin:  ${data.date_de_debut.substring(0, 10)}",
                  style: const TextStyle(
                      color: Color.fromRGBO(123, 120, 170, 1),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Heure: ${data.date_de_debut.substring(10, 16)}",
                  style: const TextStyle(
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
  }
}