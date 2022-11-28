import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

import '../../controllers/invitation.dart';
import '../../models.dart/invitations.dart';

class InvitationDetails extends StatelessWidget {
  final int invitationId;
  const InvitationDetails({
    required this.invitationId,
    super.key});

  @override
  Widget build(BuildContext context) {
    Invitation invitation = Provider.of<InvitationController>(context, listen: true)
        .items
        .where((element) => element.id == invitationId)
        .first;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xFF19173D),
        leading: IconButton(
            onPressed: () {
              //Back
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          "Invitation",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
          ),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         //Icon
        //       },
        //       icon: const Icon(Icons.menu))
        // ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Row(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Noms & Prénoms: "),
              Text(invitation.nom_prenoms, style: const TextStyle(fontWeight: FontWeight.bold, ),),
            ],
          ),
          // Row(
          //   children: const [
          //     Text("Titre de l'evenement"),
          //     Text("fggggg"),
          //   ],
          // ),
          const SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Nombre de place: "),
              Text("${invitation.place}", style: const TextStyle(fontWeight: FontWeight.bold, ),),
            ],
          ),const SizedBox(height: 10,),
          Image.network("http://first.banjoocash.com${invitation.lien_code}".replaceFirst('com.', 'com'),
          height: 150, width: 150,fit: BoxFit.cover,
          ),
          TextButton(onPressed: ()async{
            Uri url = Uri.parse("http://first.banjoocash.com${invitation.lien_code}".replaceFirst('com.', 'com'));
            print("url ====== $url");
            final date = "${DateTime.now()}".substring(0,19)
            .replaceAll(':', "-").replaceAll(" ", "-");
            final response = await http.get(url);
            final byte = response.bodyBytes;
            final temp = await getTemporaryDirectory();
            final path = "${temp.path}/$date.png";
            print(path.toString());
            final x = File(path).writeAsBytesSync(byte);
            x;
            await Share.shareXFiles([XFile(path)], text: "New Guest", subject: "image subject");
            // .share(" ton app "
            // .replaceFirst('com.', 'com'),
            // );
          }, child: const Text("Envoyer"))
        ],
      ),
    );
  }
}