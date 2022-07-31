import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const SubmitButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 3,
          left: 3,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: const Border(
            bottom: BorderSide(
              color: Colors.black,
            ),
            top: BorderSide(
              color: Colors.black,
            ),
            right: BorderSide(
              color: Colors.black,
            ),
            left: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: onPressed,
          color: Colors.orangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
