import 'package:flutter/material.dart';
import 'package:guests/screens/Login.dart';
import 'package:guests/widgets/ButtonWidget.dart';
import 'package:guests/widgets/InputFormWidget.dart';
import 'package:provider/provider.dart';

import '../controllers/auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String groupValue = 'M';

  @override
  Widget build(BuildContext context) {
    TextEditingController lastNameController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController telController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset("assets/images/logo.png"),
              const SizedBox(
                height: 20,
              ),
              // ignore: prefer_const_constructors
              Text(
                'Inscription',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 40,
              ),
              InputFormWidget(
                  nameController: lastNameController,
                  label: 'Entrez votre nom',
                  obscure: false),
              const SizedBox(
                height: 20,
              ),
              InputFormWidget(
                  nameController: firstNameController,
                  label: "Entrez votre/vos prénoms",
                  obscure: false),
              const SizedBox(
                height: 20,
              ),
              InputFormWidget(
                  nameController: emailController,
                  label: "Entrez votre email",
                  obscure: false),
              const SizedBox(
                height: 20,
              ),
              InputFormWidget(
                  nameController: telController,
                  label: "Entrez votre contact",
                  obscure: false),
              const SizedBox(
                height: 20,
              ),
              InputFormWidget(
                  nameController: passwordController,
                  label: "Entrez votre password",
                  obscure: false),const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Sexe:",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              

              Theme(
                data: Theme.of(context)
                    .copyWith(unselectedWidgetColor: Colors.white),
                child: RadioListTile(
                    title: const Text(
                      'Masculin',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 20),
                    ),
                    value: "M",
                    activeColor: Colors.white,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    }),
              ),

              Theme(
                data: Theme.of(context)
                    .copyWith(unselectedWidgetColor: Colors.white),
                child: RadioListTile(
                  title: const Text(
                    'Féminin',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 20),
                  ),
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                  groupValue: groupValue,
                  value: "F",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                text: "Inscription",
                tap: () {
                  var login =
                      Provider.of<AuthController>(context, listen: false).register(
                        lastname: lastNameController.text.trim(),
                        firstname: firstNameController.text.trim(), 
                        sexe: groupValue, 
                        contact: telController.text.trim() as int, 
                        email: emailController.text.trim(), 
                        password: passwordController.text.trim());
                          // .get_all_users();
                  login.then((value) => value == true
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                          return const Login();
                        }))
                      : null);
                },
              ),
              FittedBox(
                child: Row(
                  // ignore: sort_child_properties_last
                  children: [
                    const Text(
                      'Avez-vous déja un compte ?',
                      style:
                          TextStyle(color: Colors.white, fontFamily: "Poppins"),
                    ),
                    TextButton(
                      child: const Text(
                        'Connectez-vous',
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                          return const Login();
                        }));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
