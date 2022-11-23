
import 'package:flutter/material.dart';
import 'package:guests/screens/Events.dart';
import 'package:guests/screens/Inscription.dart';
import 'package:provider/provider.dart';
import '../controllers/auth.dart';
import '../widgets/ButtonWidget.dart';
import '../widgets/InputFormWidget.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey formKey = GlobalKey<FormState>();
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
                key: formKey,
                child: Column(
                  children: [
                    InputFormWidget(
                      nameController: emailController,
                      label: 'Entrez votre email',
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormWidget(
                      nameController: passwordController,
                      label: 'Entrez votre mot de passord',
                      obscure: true,
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
              tap: () {
                var login = Provider.of<AuthController>(context, listen: false)
                // .get_all_users();
                .login(
                    email: emailController.text,
                    password: passwordController.text);
                login.then((value) => 
                value == true ? 
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                        return const Events();
                      }))
                    : null
                    );
                    // Provider.of<EventController>(context, listen: false).events_list();
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
                    style: TextStyle(color: Colors.white, fontFamily: "Poppins"),
                  ),
                  TextButton(
                    child: const Text(
                      'Inscrivez-vous',
                      style: TextStyle( fontFamily: "Poppins"),
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

