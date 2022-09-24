// ignore_for_file: missing_return

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String errVal;
  final IconData icon;
  // final TextEditingController controller;
  final Function onChange;


  CustomTextField({
    required this.hint,
    // required this.controller,
    required this.icon,
    required this.errVal,
    required this.onChange,
  });

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controller,
        onChanged: onChange(),
        obscureText: hint == 'Enter your password' ? true : false,
        validator: (value) {
          if (value!.isEmpty) {
            return errVal;
          }
        },
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hint,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
        ),
        // onSaved: onClick(),
      ),
    );
  }
}
