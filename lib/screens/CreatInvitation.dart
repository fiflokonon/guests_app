import 'package:flutter/material.dart';
import 'package:guests/widgets/ButtonWidget.dart';
import 'package:guests/widgets/InputFormWidget.dart';
import 'package:provider/provider.dart';

import '../controllers/invitation.dart';

class CreateInvitation extends StatefulWidget {
  final int eventId;
  const CreateInvitation({required this.eventId, super.key});

  @override
  State<CreateInvitation> createState() => _CreateInvitationState();
}

class _CreateInvitationState extends State<CreateInvitation> {
  int counter = 1;
  bool isNFC = false;

  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            )),
        title: const Text(
          "Créer une invitation",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              InputFormWidget(
                  nameController: nomController,
                  label: "Nom de l'invité",
                  obscure: false),
              const SizedBox(
                height: 20,
              ),
              InputFormWidget(
                  nameController: prenomController,
                  label: "Prénoms de l'invité",
                  obscure: false),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nombre de place:",
                  style: TextStyle(
                      color: Color.fromARGB(255, 192, 182, 182),
                      fontFamily: "Poppins",
                      fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 23, 47, 90),
                          borderRadius: BorderRadius.circular(3.5)),
                      //margin: const EdgeInsets.only(right: 116.0),
                      //padding: const EdgeInsets.only(right: 20.0),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              counter <= 1 ? counter = 1 : counter--;
                            });
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 35,
                          )),
                    ),
                    Center(
                        child: Text(
                      counter.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 30),
                    )),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 23, 47, 90),
                          borderRadius: BorderRadius.circular(3.5)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              counter >= 5 ? counter = 5 : counter++;
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Moyens d'inviation:",
                  style: TextStyle(
                      color: Color.fromARGB(255, 192, 182, 182),
                      fontFamily: "Poppins",
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const ImageIcon(
                        AssetImage("assets/images/qr-code_1.png"),
                        color: Colors.white,
                        size: 60,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Code QR",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Poppins"),
                      ),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: Colors.white),
                        child: Radio(
                            activeColor: Colors.white,
                            value: false,
                            groupValue: isNFC,
                            onChanged: (value) {
                              setState(() {
                                isNFC = value!;
                              });
                            }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const ImageIcon(
                        AssetImage("assets/images/nfc_1.png"),
                        color: Colors.white,
                        size: 60,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Carte NFC",
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Poppins"),
                      ),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: Colors.white),
                        child: Radio(
                            activeColor: Colors.white,
                            value: true,
                            groupValue: isNFC,
                            onChanged: (value) {
                              setState(() {
                                isNFC = value!;
                              });
                            }),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ButtonWidget(
                text: "Créer l'invitation",
                tap: () {
                  var invitation =
                      Provider.of<InvitationController>(context, listen: false)
                          .create_Invitation(
                              idEvent: widget.eventId,
                              nom_prenoms: "$nomController $prenomController",
                              place: counter);
                  invitation.then((value) {
                    if (value == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Evenement creer")));
                      return Navigator.pop(context);
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
