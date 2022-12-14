import 'package:flutter/material.dart';
import 'package:guests/screens/auth/Login.dart';
import 'package:guests/widgets/ButtonWidget.dart';
import 'package:guests/widgets/InputFormWidget.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String groupValue = 'M';
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              Form(
                  key: _formkey,
                  child: Column(children: [
                    InputFormWidget(
                        keyboardType: TextInputType.name,
                        nameController: lastNameController,
                        label: 'Entrez votre nom',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Vous devez fourni ce champ";
                          }
                          return null;
                        },
                        obscure: false),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormWidget(
                        keyboardType: TextInputType.name,
                        nameController: firstNameController,
                        label: "Entrez votre/vos pr??noms",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Vous devez fourni ce champ";
                          }
                          return null;
                        },
                        obscure: false),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormWidget(
                        keyboardType: TextInputType.emailAddress,
                        nameController: emailController,
                        label: "Entrez votre email",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Vous devez fourni ce champ";
                          } else if (!value.contains("@")) {
                            return "Email invalide";
                          }
                          return null;
                        },
                        obscure: false),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormWidget(
                        keyboardType: TextInputType.phone,
                        nameController: telController,
                        label: "Entrez votre contact",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Vous devez fourni ce champ";
                          }
                          return null;
                        },
                        obscure: false),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormWidget(
                        keyboardType: TextInputType.visiblePassword,
                        nameController: passwordController,
                        label: "Entrez votre mot de passe",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Vous devez fourni ce champ";
                          }
                          return null;
                        },
                        obscure: _secureText,
                        suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                _secureText = !_secureText;
                              });
                            },
                            child: _secureText
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off))),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormWidget(
                      keyboardType: TextInputType.visiblePassword,
                      nameController: passConfirmController,
                      label: "Entrez a nouveau le mot de passe",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Vous devez fourni ce champ";
                        } else if (value != passwordController.text) {
                          return "Donn??e non identique";
                        }
                        return null;
                      },
                      obscure: _secureText,
                      suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                          child: _secureText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                    ),
                  ])),
              const SizedBox(
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
                    'F??minin',
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
                  if (_formkey.currentState!.validate()) {
                    var signIn =
                        Provider.of<AuthController>(context, listen: false)
                            .register(
                                lastname: lastNameController.text.trim(),
                                firstname: firstNameController.text.trim(),
                                sexe: groupValue,
                                contact: telController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                    // .get_all_users();
                    signIn.then((value) {
                      if (value['success']) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          value['message'],
                          textAlign: TextAlign.center,
                        )));
                        return Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Login();
                        }));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          value['message'],
                          textAlign: TextAlign.center,
                        )));
                      }
                    });
                  }
                },
              ),
              FittedBox(
                child: Row(
                  // ignore: sort_child_properties_last
                  children: [
                    const Text(
                      'Avez-vous d??ja un compte ?',
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
