import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/presences.dart';
import '../models.dart/presence.dart';

class TabloScreen extends StatelessWidget {
  String eventId;
  TabloScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: Provider.of<PresenceController>(context, listen: false)
                .get_event_presence(event: eventId),
            builder: (context, snapshot) {
              print(snapshot.data!['data']);
              return snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : snapshot.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator(),):
                      snapshot.hasData &&  snapshot.data!['success']
                      ? DataTable(
                          columns: const [
                              DataColumn(label: Text("Noms")),
                              DataColumn(label: Text("Places Disponibles")),
                              DataColumn(label: Text("Places Occupées")),
                              DataColumn(label: Text("Places restantes"))
                            ],
                          rows: snapshot.data!['data']
                              .map<DataRow>((e) => DataRow(cells: [
                                    DataCell(Text(e.nomPrenoms)),
                                    DataCell(Text("${e.placeDispo}")),
                                    DataCell(Text("${e.placeOccupe}")),
                                    DataCell(Text("${e.placeRest}"))
                                  ]))
                              .toList())
                      :  Center(
                          child: Text(
                            snapshot.data!['message'],
                            textAlign: TextAlign.center,
                          ),
                        );
            }));
  }
}
