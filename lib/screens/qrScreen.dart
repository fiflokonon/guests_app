import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guests/controllers/presences.dart';
import 'package:guests/models.dart/presence.dart';
import 'package:guests/widgets/ButtonWidget.dart';
import 'package:guests/widgets/loadingWidget.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  int counter = 1;
  bool isLoad = false;
  late PresenceModel presence;
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.resumeCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Column(
            children: [
              Center(
                child: (result != null)
                    ? const Text('Scan reussi')
                    : const Text('Scanner un code'),
              ),
              if (result != null)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                  child: ButtonWidget(
                      text: "Envoyer",
                      tap: () {
                        addDialog(context);
                      }),
                ),
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> addDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return FutureBuilder<Object>(
                future: Provider.of<PresenceController>(context, listen: false)
                    .get_invitation_infos(qr: result!.code!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loading();
                  } else if (snapshot.hasData) {
                    presence = snapshot.data as PresenceModel;
                    return Dialog(
                      // backgroundColor: Colors.black54,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      presence.eventTitle,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 23, 47, 90),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${presence.nomPrenoms} a une invitation de ${presence.placeDispo} places avec ${presence.placeOccupe} places occupées",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 23, 47, 90)),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Veuillez definir le nombre de place que vous voulez prendre",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 23, 47, 90)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 23, 47, 90),
                                          borderRadius:
                                              BorderRadius.circular(3.5)),
                                      //margin: const EdgeInsets.only(right: 116.0),
                                      //padding: const EdgeInsets.only(right: 20.0),
                                      child: IconButton(
                                          onPressed: () {
                                            print(counter);
                                            setState(() {
                                              counter <= 1
                                                  ? counter = 1
                                                  : counter--;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 35,
                                          )),
                                    ),
                                    Center(
                                        child: Text(
                                      counter.toString(),
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 23, 47, 90),
                                          fontFamily: "Poppins",
                                          fontSize: 30),
                                    )),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 23, 47, 90),
                                          borderRadius:
                                              BorderRadius.circular(3.5)),
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              counter >= 5
                                                  ? counter = 5
                                                  : counter++;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                    ),
                                  ],
                                ),
                                isLoad
                                    ? const CircularProgressIndicator()
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ButtonWidget(
                                            text: "Enregistrer",
                                            tap: () {
                                              setState(() {
                                                isLoad = true;
                                              });
                                              Provider.of<PresenceController>(
                                                      context,
                                                      listen: false)
                                                  .createPresence(
                                                      invitation:
                                                          "${presence.invitationId}",
                                                      place: "$counter")
                                                  .then((value) {
                                                // setState(() {
                                                //   presence = value['present'];
                                                // });
                                                Navigator.pop(context);
                                                messageDialog(context, value);
                                              });
                                            }),
                                      )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    print(snapshot.error);
                    return Dialog(
                        child: Container(
                      padding: const EdgeInsets.all(12.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          SizedBox(
                            height: 30,
                          ),
                          Text("Veuillez reessayer le scan",textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 23, 47, 90),),),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ));
                  }
                });
          });
        });
  }

  Future<dynamic> messageDialog(
      BuildContext context, Map<dynamic, dynamic> value) {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
                child: Container(
              padding: const EdgeInsets.all(12.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    value['message'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 23, 47, 90),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
