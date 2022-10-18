
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      // ignore: sort_child_properties_last
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 25, color: Colors.white,
              ),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
          // ignore: prefer_const_literals_to_create_immutables
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(13, 166, 194, 1),
            Color.fromRGBO(14, 57, 198, 1)
          ]),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
