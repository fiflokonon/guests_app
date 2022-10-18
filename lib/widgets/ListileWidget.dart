import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListileWigdet extends StatelessWidget {
  const ListileWigdet({
    Key? key,
    required this.text,
    required this.iconData
  }) : super(key: key);

  final String text;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  CircleAvatar(
        child: Icon(iconData),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(123, 120, 170, 1)),
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: "Poppins",
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
