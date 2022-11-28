import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guests/widgets/ButtonWidget.dart';
import 'package:guests/widgets/InputFormWidget.dart';
import 'package:provider/provider.dart';

import '../../controllers/events.dart';

class CreatEvent extends StatefulWidget {
  const CreatEvent({super.key});

  @override
  State<CreatEvent> createState() => _CreatEventState();
}

class _CreatEventState extends State<CreatEvent> {
  String starTime = "";
  String starDay = "";
  String endDay = "";
  String endTime = "";
  TextEditingController eventNameController = TextEditingController();
  TextEditingController sloganController = TextEditingController();
  TextEditingController descriptController = TextEditingController();
  TextEditingController logoController = TextEditingController();
  TextEditingController starTimeController = TextEditingController();
  TextEditingController starDayController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController endDayController = TextEditingController();
  File? _photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF19173D),
        centerTitle: true,
        leading: IconButton(
            onPressed: () { Navigator.pop(context);},
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            )),
        title: const Text(
          "Créer un événement",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              InputFormWidget(
                  nameController: eventNameController,
                  label: "Nom de l'événement",
                  obscure: false),
              const SizedBox(
                height: 25,
              ),
              InputFormWidget(
                  nameController: sloganController,
                  label: "Slogan",
                  obscure: false),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022, 10, 20),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 700)))
                            .then((value) {
                          setState(() {
                            starDay = value!.toString().substring(0, 10);
                            
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                        child: Center(
                          child: starDay.isEmpty
                              ? const Text(
                                  "Date de debut",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 192, 182, 182),
                                      fontFamily: "Poppins",
                                      fontSize: 15),
                                )
                              : Text(
                                  starDay,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontSize: 15),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          setState(() {
                            starTime = value!.format(context);
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2.0),
                        ),
                        child: Center(
                            child: starTime.isEmpty
                                ? const Text(
                                    "Heure",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 192, 182, 182),
                                        fontFamily: "Poppins",
                                        fontSize: 15),
                                  )
                                : Text(
                                    starTime,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins",
                                        fontSize: 15),
                                  )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022, 10, 20),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 700)))
                            .then((value) {
                          setState(() {
                            endDay = value!.toString().substring(0, 10);
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                        child: Center(
                          child: endDay.isEmpty
                              ? const Text(
                                  "Date de fin",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 192, 182, 182),
                                      fontFamily: "Poppins",
                                      fontSize: 15),
                                )
                              : Text(
                                  endDay,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontSize: 15),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          setState(() {
                            endTime = value!.format(context);
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 2.0),
                        ),
                        child: Center(
                            child: endTime.isEmpty
                                ? const Text(
                                    "Heure",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 192, 182, 182),
                                        fontFamily: "Poppins",
                                        fontSize: 15),
                                  )
                                : Text(
                                    endTime,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins",
                                        fontSize: 15),
                                  )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // InkWell(
              //   onTap: (() async {
              //     var img = await imagePicked();
              //     setState(() {
              //       _photo = File(img.path);
                    
              //     });
              //   }),
              //   child: Container(
              //       height: 50,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //         border: Border.all(color: Colors.white, width: 2.0),
              //       ),
              //       child: Center(
              //         child: _photo == null
              //             ? const Text(
              //                 "Logo de l'événement(Optionnel)",
              //                 style: TextStyle(
              //                     color: Color.fromARGB(255, 192, 182, 182),
              //                     fontFamily: "Poppins",
              //                     fontSize: 15),
              //               )
              //             : Text(
              //                 "link: ${_photo!.path}",
              //                 style: const TextStyle(
              //                     color: Colors.white,
              //                     fontFamily: "Poppins",
              //                     fontSize: 15),
              //               ),
              //       )),
              // ),
              const SizedBox(
                height: 20,
              ),
              InputFormWidget(
                nameController: descriptController,
                label: "Description de l'événement",
                obscure: false,
                maxLines: 3,
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonWidget(
                text: "Créer l'événement",
                tap: () {
                 var event = Provider.of<EventController>(context, listen: false)
                      .create_Event(
                          idUser: "1",
                          titre: eventNameController.text,
                          slogan: sloganController.text,
                          description: descriptController.text,
                          lieu: sloganController.text,
                          date_de_debut: "$starDay $starTime",
                          date_de_fin: "$endDay $endTime");
                  event.then((value) {
                    if(value==true){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Evenement créée", textAlign: TextAlign.center,)));
                      return Navigator.pop(context);
                    }
                  } );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
