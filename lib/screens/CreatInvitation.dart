import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guests/widgets/InputFormWidget.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class CreateInvitation extends StatelessWidget {
  const CreateInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nomController = TextEditingController();
    TextEditingController prenomController = TextEditingController();
    TextEditingController placeController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xFF19173D),
        leading: IconButton(onPressed: () {
          //Back
        }, icon: const Icon(Icons.arrow_back_ios_new_sharp,
        color: Colors.white,)),
        title: const Text("Créer une invitation",
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700
        ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            InputFormWidget(nameController: nomController,
             label: "Nom de l'invité", obscure: false),
            const SizedBox(
              height: 20,
            ),
            InputFormWidget(nameController: prenomController, 
            label: "Prénoms de l'invité", obscure: false),
            const SizedBox(
              height: 20,
            ),
            InputFormWidget(nameController: placeController, 
            label: "Nombre de place", obscure: false),
            

          ],
        ),
      ),
    );
  }
}