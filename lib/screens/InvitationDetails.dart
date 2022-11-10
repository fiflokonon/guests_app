import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InvitationDetails extends StatelessWidget {
  const InvitationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xFF19173D),
        leading: IconButton(
            onPressed: () {
              //Back
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          "Invitation",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                //Icon
              },
              icon: const Icon(Icons.menu))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}