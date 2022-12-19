import 'package:flutter/material.dart';
import 'package:guests/screens/auth/Inscription.dart';
import 'package:guests/screens/screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/auth.dart';
import '../../widgets/ButtonWidget.dart';
import '../../widgets/InputFormWidget.dart';
import '../../widgets/loadingWidget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Image.asset('assets/images/logo.png'),
            const SizedBox(
              height: 30,
            ),
            // ignore: prefer_const_constructors
            Text(
              'Connexion',
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputFormWidget(keyboardType: TextInputType.emailAddress,
                      nameController: emailController,
                      label: 'Entrez votre email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Vous devez fourni ce champ";
                        } else if (!value.contains('@')) {
                          return "Email invalide";
                        }
                        return null;
                      },
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormWidget(keyboardType: TextInputType.visiblePassword,
                      nameController: passwordController,
                      label: 'Entrez votre mot de passe',
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
                              : const Icon(Icons.visibility_off)),
                    ),
                  ],
                )),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              // ignore: prefer_const_constructors, sort_child_properties_last
              child: const Align(
                // ignore: sort_child_properties_last
                child: Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(
                      color: Color.fromRGBO(189, 177, 177, 1),
                      fontFamily: 'Poppins'),
                ),
                alignment: Alignment.topRight,
              ),
            ),
            ButtonWidget(
              text: "Connexion",
              tap: () async {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Loading();
                      });
                  var login =
                      Provider.of<AuthController>(context, listen: false)
                          // .get_all_users();
                          .login(
                              email: emailController.text,
                              password: passwordController.text);
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('mail', emailController.text);
                  await prefs.setString('pass', passwordController.text);
                  login.then((value) => value == true
                      ? Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                          return const Screen();
                        }), (route) => false)
                      : null);
                  // Provider.of<EventController>(context, listen: false).events_list();}
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            FittedBox(
              child: Row(
                // ignore: sort_child_properties_last
                children: [
                  const Text(
                    'Vous n\'avez pas de compte ?',
                    style:
                        TextStyle(color: Colors.white, fontFamily: "Poppins"),
                  ),
                  TextButton(
                    child: const Text(
                      'Inscrivez-vous',
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    onPressed: () {
                      //signup screen
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Signup();
                      }));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
