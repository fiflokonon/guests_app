import 'package:flutter/material.dart';

class InputFormWidget extends StatelessWidget {
  const InputFormWidget(
      {Key? key,
      required this.nameController,
      required this.label,
      required this.obscure,
      this.maxLines,
      this.suffix,
      this.validator,
      this.keyboardType})
      : super(key: key);

  final TextEditingController nameController;
  final String label;
  final bool obscure;
  final int? maxLines;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      style: const TextStyle(color: Colors.white),
      controller: nameController,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: suffix,
          labelText: label,
          labelStyle: const TextStyle(
              fontFamily: 'Poppins', color: Color.fromARGB(255, 192, 182, 182)),
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
