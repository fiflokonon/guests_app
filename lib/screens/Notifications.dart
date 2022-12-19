import 'package:flutter/material.dart';

class Notifs extends StatelessWidget {
  const Notifs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Notifications",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                //Icon
              },
              icon: const Icon(Icons.circle_notifications))
        ],
        elevation: 0.0,
        backgroundColor: const Color(0xFF19173D),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) =>
              Container(
        padding: const EdgeInsets.all(7.0),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(38, 36, 80, 1),
            borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.notification_add_sharp,
                      color: Colors.green,
                    ),
                    const Text("Nouvelle notification", 
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold
                    ),),
                    IconButton(onPressed: () {
                      //Delete
                    }, icon: const Icon(Icons.cancel_outlined,
                    color: Colors.red,))
                  ],
                ),
                const Text("Aujourd'hui à 12h",
                style: TextStyle(color: Color.fromRGBO(123, 120, 170, 1),
                fontFamily: "Poppins",
                fontStyle: FontStyle.italic
                ),
                )
              ],
            )
            )
         )),

    );
  }
}
