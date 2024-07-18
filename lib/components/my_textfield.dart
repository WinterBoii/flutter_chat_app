import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  bool hide = false;

  MyTextField(
      {super.key,
      required this.hintText,
      this.hide = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          hintText: hintText,
        ),
        obscureText: hide,
      ),
    );
  }
}
