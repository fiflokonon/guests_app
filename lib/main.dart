import 'package:flutter/material.dart';
import 'package:guests/screens/splash.dart';
import 'package:provider/provider.dart';

import 'controllers/auth.dart';
import 'controllers/events.dart';
import 'controllers/invitation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthController(),
        ),
        ChangeNotifierProxyProvider<AuthController, EventController>(
            create: (ctx) => EventController('', [],[],[],[]),
            update: (ctx, auth, previousEvents) => previousEvents!.items.isNotEmpty ? 
             EventController(auth.token,previousEvents.items,
             previousEvents.currentItems,previousEvents.futureItems,previousEvents.pastItems):
             EventController(auth.token,[],[],[],[])),
        ChangeNotifierProxyProvider<AuthController, InvitationController>(
            create: (ctx) => InvitationController('', []),
            update: (ctx, auth, previousInvitations) => InvitationController(auth.token,
                previousInvitations!.items.isNotEmpty ? previousInvitations.items : [])),
      ],
      child: Consumer<AuthController>(builder: (ctx, auth, _) {
        return MaterialApp(
          title: 'Guests',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xFF19173D),
              fontFamily: "Poppins",
              // primarySwatch: Colors.blue,
    // textTheme:
    //     const TextTheme(
    //   headline1: TextStyle(color: Colors.white),
    //   headline2: TextStyle(color: Colors.white),
    //   bodyText2: TextStyle(color: Colors.white),
    //   subtitle1: TextStyle(color: Colors.white30),
    // ),
    brightness: Brightness.dark
    ),
          home: const SplashScreen(),
        );
      }),
    );
  }
}
