import 'package:flutter/material.dart';

Widget buttonWidget ({String? textButton, Function()? onTap, Color? colorButton}){
  return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton ?? Colors.blueAccent,
        minimumSize: Size(200, 40),
      ),
      child: Text(textButton ?? '',style: TextStyle(fontSize: 16, color: Colors.white),));
}