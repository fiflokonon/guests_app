import 'package:flutter/material.dart';
import 'package:guests/screens/tablo.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../controllers/presences.dart';
import '../widgets/ButtonWidget.dart';

class Statistique extends StatelessWidget {
  String eventId;
  Statistique({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff25234f),
      body: FutureBuilder(
          future: Provider.of<PresenceController>(context, listen: false)
              .get_event_stats(event: eventId),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : snapshot.hasData && snapshot.data!['success']
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Chart(
                              title: snapshot.data!['data']['eventTitle'],
                              presents:
                                  "${snapshot.data!['data']['nbPresents']}",
                              invitees:
                                  "${snapshot.data!['data']['nbInvites']}",
                              stats: snapshot.data!['data']['nbPresents'] *
                                  100 /
                                  snapshot.data!['data']['nbInvites']),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(height: 150),
                                const Text(
                                    "Les statistiques liées à l'evènement",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        // fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                                RichText(
                                  text: TextSpan(
                                      text: "Nombre d'invité: ",
                                      style: const TextStyle(
                                          fontFamily: "Poppins",
                                          // fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                            text:
                                                "${snapshot.data!['data']['nbInvites']}   personnes",
                                            style: const TextStyle(
                                                fontFamily: "Poppins",
                                                // fontSize: 20,
                                                // fontWeight: FontWeight.w400,
                                                color: Color(0xff8426db)))
                                      ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Nombre présent: ",
                                      style: const TextStyle(
                                          fontFamily: "Poppins",
                                          // fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                            text:
                                                "${snapshot.data!['data']['nbPresents']}      personnes",
                                            style: const TextStyle(
                                                fontFamily: "Poppins",
                                                // fontSize: 20,
                                                // fontWeight: FontWeight.w400,
                                                color: Color(0xff4fd282)))
                                      ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Nombre d'absent : ",
                                      style: const TextStyle(
                                          fontFamily: "Poppins",
                                          // fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                            text:
                                                "${snapshot.data!['data']['nbAbsent']}      personnes",
                                            style: const TextStyle(
                                                fontFamily: "Poppins",
                                                // fontSize: 20,
                                                // fontWeight: FontWeight.w400,
                                                color: Color(0xffc63e44)))
                                      ]),
                                ),
                                // ButtonWidget(
                                //   text: "Details",
                                //   tap: () {
                                //     Navigator.push(context,
                                //         MaterialPageRoute(builder: (context) {
                                //       return TabloScreen(
                                //         eventId: eventId,
                                //       );
                                //     }));
                                //   },
                                // )
                              ],
                            ),
                          )),
                        ],
                      )
                    : Center(
                        child: Text(
                          snapshot.data!['message'],
                          textAlign: TextAlign.center,
                        ),
                      );
          }),
    );
  }
}

class Chart extends StatelessWidget {
  double stats;
  String presents, invitees, title;
  Chart(
      {Key? key,
      required this.stats,
      required this.invitees,
      required this.presents,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 260,
          width: double.infinity,
          color: const Color(0xFF19173d),
        ),
        Positioned(
            // top: 10,
            child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 45.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                child: Image.asset("assets/images/image_3.png"),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontFamily: "Oleo_Script",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  // Text("Chill family de retour",
                  //     style: TextStyle(
                  //         fontFamily: "Poppins",
                  //         // fontSize: 20,
                  //         // fontWeight: FontWeight.w400,
                  //         color: Color.fromARGB(220, 255, 255, 255))),
                ],
              )
            ],
          ),
        )),
        Positioned(
          bottom: -140,
          left: 0,
          right: 0,
          child: Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 140,
                  backgroundColor: Color(0xFF19173d),
                ),
                SizedBox(
                    height: 280,
                    width: 280,
                    child: SfRadialGauge(
                        // backgroundColor: Colors.blue,
                        axes: <RadialAxis>[
                          RadialAxis(
                              interval: 10,
                              radiusFactor: 1,
                              startAngle: 0,
                              endAngle: 360,
                              showTicks: false,
                              showLabels: false,
                              axisLineStyle: const AxisLineStyle(
                                  thickness: 35,
                                  color: Color.fromARGB(255, 3, 57, 102)),
                              pointers: <GaugePointer>[
                                RangePointer(
                                    value: stats,
                                    width: 35,
                                    color: const Color(0xff8426db),
                                    enableAnimation: true,
                                    cornerStyle: CornerStyle.bothCurve),
                                RangePointer(
                                    value: stats * 0.66,
                                    width: 35,
                                    color: const Color(0xff4fd282),
                                    enableAnimation: true,
                                    cornerStyle: CornerStyle.bothCurve),
                                RangePointer(
                                    value: stats * 0.33,
                                    width: 35,
                                    color: const Color(0xffc63e44),
                                    enableAnimation: true,
                                    cornerStyle: CornerStyle.bothCurve),
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  angle: 270,
                                  positionFactor: 0.1,
                                  widget: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$invitees invitées",
                                        style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "dont $presents présents",
                                        style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ])
                        ])),
              ],
            ),
          ),
        )
      ],
    );
  }
}
