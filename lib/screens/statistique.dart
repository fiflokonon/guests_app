import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../widgets/ButtonWidget.dart';

class Statistique extends StatelessWidget {
  const Statistique({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff25234f),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     "Mes événements",
      //     style: TextStyle(
      //         color: Colors.white,
      //         fontFamily: "Poppins",
      //         fontWeight: FontWeight.w700),
      //   ),
      //   leading: IconButton(
      //       onPressed: () {
      //         //Back
      //       },
      //       icon: const Icon(
      //         Icons.arrow_back_ios_new_sharp,
      //         color: Colors.white,
      //       )),
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Chart(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 150),
                const Text("Les statistiques liées à l'evènement",style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                // fontWeight: FontWeight.w400,
                                color: Colors.white)),
                RichText(
                  text: const TextSpan(
                      text: "Nombre d'invité: ",
                      style: TextStyle(
                                fontFamily: "Poppins",
                                // fontWeight: FontWeight.w400,
                                color: Colors.white),
                      children: [
                        TextSpan(
                            text: "600   personnes",style: TextStyle(
                                fontFamily: "Poppins",
                                // fontSize: 20,
                                // fontWeight: FontWeight.w400,
                                color: Color(0xff8426db)))
                      ]),
                ),RichText(
                  text: const TextSpan(
                      text: "Nombre présent: ",
                      style: TextStyle(
                                fontFamily: "Poppins",
                                // fontWeight: FontWeight.w400,
                                color: Colors.white),
                      children: [
                        TextSpan(
                            text: "400   personnes",style: TextStyle(
                                fontFamily: "Poppins",
                                // fontSize: 20,
                                // fontWeight: FontWeight.w400,
                                color: Color(0xff4fd282)))
                      ]),
                ),RichText(
                  text: const TextSpan(
                      text: "Nombre d'absent : ",
                      style: TextStyle(
                                fontFamily: "Poppins",
                                // fontWeight: FontWeight.w400,
                                color: Colors.white),
                      children: [
                        TextSpan(
                            text: "200   personnes",style: TextStyle(
                                fontFamily: "Poppins",
                                // fontSize: 20,
                                // fontWeight: FontWeight.w400,
                                color: Color(0xffc63e44)))
                      ]),
                ),
                ButtonWidget(
                  text: "Quitter",
                  tap: () {},
                )
              ],
            ),
          )),],
      ),
    );
  }
}



class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

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
                children: const [
                  Text("FestiChill",style: TextStyle(
                                fontFamily: "Oleo_Script",
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                  Text("Chill family de retour",style: TextStyle(
                                fontFamily: "Poppins",
                                // fontSize: 20,
                                // fontWeight: FontWeight.w400,
                                color: Color.fromARGB(220, 255, 255, 255))),
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
                              pointers: const <GaugePointer>[
                                RangePointer(
                                    value: 60,
                                    width: 35,
                                    color: Color(0xff8426db),
                                    enableAnimation: true,
                                    cornerStyle: CornerStyle.bothCurve),
                                RangePointer(
                                    value: 40,
                                    width: 35,
                                    color: Color(0xff4fd282),
                                    enableAnimation: true,
                                    cornerStyle: CornerStyle.bothCurve),
                                RangePointer(
                                    value: 20,
                                    width: 35,
                                    color: Color(0xffc63e44),
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
                                    children: const [
                                      Text("600 invités",
                                                      style: TextStyle(
                                                                fontFamily: "Poppins",
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w800,
                                                                color: Colors.white),),
                                      Text("dont 400 présents",
                                                      style: TextStyle(
                                                                fontFamily: "Poppins",
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w400,
                                                                color: Colors.white),)
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