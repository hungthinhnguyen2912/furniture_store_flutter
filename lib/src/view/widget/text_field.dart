import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintext;
  final TextEditingController controller;
  final bool obs;
  const MyTextField({super.key, required this.controller, required this.hintext, required this.obs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          hintText: hintext,
        ),
        obscureText: obs,
      ),
    );
  }
}
