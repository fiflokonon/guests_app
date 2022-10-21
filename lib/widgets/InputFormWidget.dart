import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputFormWidget extends StatelessWidget {
  const InputFormWidget({
    Key? key,
    required this.nameController,
    required this.label,
    required this.obscure,
    this.maxLines
  }) : super(key: key);

  final TextEditingController nameController;
  final String label;
  final bool obscure;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      style: const TextStyle(color: Colors.white),
      controller: nameController,
      obscureText: obscure,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          labelText: label,
          // ignore: prefer_const_constructors
          labelStyle: TextStyle(
              fontFamily: 'Poppins',
              color: const Color.fromARGB(255, 192, 182, 182)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              // ignore: prefer_const_constructors
              borderSide: BorderSide(color: Colors.white, width: 2.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              // ignore: prefer_const_constructors
              borderSide: BorderSide(color: Colors.white, width: 2.0))),
    );
  }
}
