import 'package:flutter/material.dart';

Widget makeInput({label, onTap, controller, obsureText = false}) {
  return TextField(
    autocorrect: false,
    controller: controller,
    onTap: onTap,
    obscureText: obsureText,
    style: const TextStyle(
      color: Colors.black,
    ),
    decoration: const InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 10,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    ),
  );
}
