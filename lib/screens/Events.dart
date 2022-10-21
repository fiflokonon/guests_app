import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(38, 36, 80, 1),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(color:Color.fromARGB(255, 104, 98, 199), 
                        offset: Offset(-2, 2),
                        blurRadius: 8.0,
                        spreadRadius: 2.5,
                        blurStyle: BlurStyle.normal),]),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Titre de l'évenement",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: "Oleo_Script",
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  height: 100,
                                  width: 200,
                                  child: Text("Lorem ipsum dolor sit amet, consecteturadipiscing elit. Urna, venenatis commodo ut leo,integer ultrices lacus. Condimentum massa neque,posuere venenatis, orci praesent",
                                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.87),
                                  fontFamily: "Poppins"),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Image.asset("assets/images/image_3.png"),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children:const  [
                            Text("Debut: 17/52/25",
                            style: TextStyle(color:Color.fromRGBO(123, 120, 170, 1), 
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins"
                            ),
                            ),
                            Text("Heure: 14:20", 
                            style: TextStyle(color: Color.fromRGBO(123, 120, 170, 1),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),)
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children:const  [
                            Text("Fin: 17/52/25",
                            style: TextStyle(color:Color.fromRGBO(123, 120, 170, 1), 
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600
                            ),
                            ),
                            Text("Heure: 14:00", 
                            style: TextStyle(color: Color.fromRGBO(123, 120, 170, 1),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        floatingActionButton: const FloatingActionButton(
          backgroundColor: Color.fromRGBO(32, 49, 92, 1),
          onPressed: null,
          child: Icon(Icons.add),),
        );
  }
}
