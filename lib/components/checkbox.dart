import 'package:flutter/material.dart';

Widget makeCheckbox({label, value, onChanged, controller}) {
  return CheckboxListTile(
    controlAffinity: ListTileControlAffinity.leading,
    title: Text(
      label,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
    ),
    value: value,
    onChanged: onChanged,
  );
}
