// import 'package:flutter/material.dart';
// import 'package:guests/screens/events/EventDetails.dart';
// import 'package:provider/provider.dart';

// import '../../controllers/auth.dart';
// import '../../controllers/events.dart';
// import '../../models.dart/events.dart';
// import '../../models.dart/user.dart';



// class EventScreen extends StatelessWidget {
//   const EventScreen({
//     Key? key,
//   }) : super(key: key);


//   @override
//   Widget build(BuildContext context) {
//     User user = Provider.of<AuthController>(context, listen: false).user;
//     return Scaffold(
//       backgroundColor: const Color(0xFF19173D),
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Mes événements",
//           style: TextStyle(
//               color: Colors.white,
//               fontFamily: "Poppins",
//               fontWeight: FontWeight.w700),
//         ),
//         leading: IconButton(
//             onPressed: () {
//               //Back
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios_new_sharp,
//               color: Colors.white,
//             )),
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: FutureBuilder(
//           future:
//               Provider.of<EventController>(context, listen: false).get_User_Events_List(id: user.id),
//           initialData:
//               Provider.of<EventController>(context, listen: false).items,
//           builder: (context, snapshot) {
//             List<Event> data =
//                 Provider.of<EventController>(context, listen: false).items;
//             return data.isEmpty
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : ListView.builder(
//                     itemCount: data.length,
//                     itemBuilder: (context, index) {
//                       return EventSelect(data: data[index]);
//                     });
//           }),
//     );
//   }
// }

// class EventSelect extends StatelessWidget {
//   const EventSelect({
//     Key? key,
//     required this.data,
//   }) : super(key: key);

//   final Event data;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (() {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) {
//           return EventDetails(
//               key: ValueKey(data.id),
//               eventId: data.id);
//         }));
//       }),
//       child: Container(
//         padding: const EdgeInsets.all(20.0),
//         margin: const EdgeInsets.all(15.0),
//         decoration: BoxDecoration(
//             color: const Color.fromRGBO(38, 36, 80, 1),
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: const [
//               BoxShadow(
//                   color: Color.fromARGB(255, 104, 98, 199),
//                   offset: Offset(-2, 2),
//                   blurRadius: 8.0,
//                   spreadRadius: 2.5,
//                   blurStyle: BlurStyle.normal),
//             ]),
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 data.titre,
//                 textAlign: TextAlign.right,
//                 style: const TextStyle(
//                     fontFamily: "Oleo_Script",
//                     fontSize: 20,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: SizedBox(
//                       height: 100,
//                       width: 200,
//                       child: Text(
//                         data.description,
//                         style: const TextStyle(
//                             color: Color.fromRGBO(
//                                 255, 255, 255, 0.87),
//                             fontFamily: "Poppins"),
//                         maxLines: 4,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.justify,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Align(
//                     alignment: Alignment.topRight,
//                     child: Image.asset(
//                         "assets/images/image_3.png"),
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.spaceBetween,
//               // ignore: prefer_const_literals_to_create_immutables
//               children:  [
//                 Text(
//                   "Debut:  ${data.date_de_debut.substring(0, 10)}",
//                   style: const TextStyle(
//                       color: Color.fromRGBO(123, 120, 170, 1),
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "Poppins"),
//                 ),
//                 Text(
//                   "Heure: ${data.date_de_debut.substring(10, 16)}",
//                   style: const TextStyle(
//                       color: Color.fromRGBO(123, 120, 170, 1),
//                       fontFamily: "Poppins",
//                       fontWeight: FontWeight.w600),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Row(
//               mainAxisAlignment:
//                   MainAxisAlignment.spaceBetween,
//               // ignore: prefer_const_literals_to_create_immutables
//               children:  [
//                 Text(
//                   "Fin:  ${data.date_de_debut.substring(0, 10)}",
//                   style: const TextStyle(
//                       color: Color.fromRGBO(123, 120, 170, 1),
//                       fontFamily: "Poppins",
//                       fontWeight: FontWeight.w600),
//                 ),
//                 Text(
//                   "Heure: ${data.date_de_debut.substring(10, 16)}",
//                   style: const TextStyle(
//                       color: Color.fromRGBO(123, 120, 170, 1),
//                       fontFamily: "Poppins",
//                       fontWeight: FontWeight.w600),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
