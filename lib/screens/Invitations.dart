import 'package:flutter/material.dart';
import 'package:guests/models.dart/invitations.dart';
import 'package:provider/provider.dart';

import '../controllers/invitation.dart';

class Invitations extends StatelessWidget {
  const Invitations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Invitations",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            )),
        actions: [
          PopupMenuButton(
              color: const Color(0xFF19173D),
              itemBuilder: ((context) => [
                    PopupMenuItem(
                        child: Row(
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Ajouter une invitation",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
                  ]))
        ],
        elevation: 0.0,
        backgroundColor: const Color(0xFF19173D),
      ),
      body: FutureBuilder(
          future: Provider.of<InvitationController>(context, listen: true)
              .get_All_Invitations(),
          initialData:
              Provider.of<InvitationController>(context, listen: true).items,
          builder: (context, snapshot) {
            List<Invitation> invitationList =
                Provider.of<InvitationController>(context, listen: false).items;
            return invitationList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: invitationList.length,
                    itemBuilder: ((context, index) => Container(
                        padding: const EdgeInsets.all(7.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(38, 36, 80, 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.mark_email_unread,
                                  color: Color(0xFF0DA6C2),
                                ),
                                 Text(
                                  invitationList[index].nom_prenoms,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {
                                      //Delete
                                    },
                                    icon: const Icon(
                                      Icons.send_outlined,
                                      color: Color(0xFF0DA6C2),
                                    ))
                              ],
                            ),
                          ],
                        ))));
          }),
    );
  }
}
