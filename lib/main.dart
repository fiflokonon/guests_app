import 'package:flutter/material.dart';
import 'package:guests/screens/Login.dart';
import 'package:provider/provider.dart';

import 'controllers/auth.dart';
import 'controllers/events.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
          ChangeNotifierProvider.value(
            value: AuthController(),
          ),          
          // ChangeNotifierProvider.value(
          //   value: EventController(),
          // ),
          ChangeNotifierProxyProvider<AuthController, EventController>(
              create: (ctx) => EventController('', []),
              update: (ctx, auth, previousEvents) => EventController(
                  auth.token,
                  previousEvents!.items.isNotEmpty
                      ? previousEvents.items
                      : [])),
    ],child: MaterialApp(
      title: 'Guests',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF19173D)
        ),
      home:const Login(),
    ),
    );
  }
}

