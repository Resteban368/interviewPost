// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:interview/utils/colors.dart';

InputDecoration inputDecorationForm(String hint) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelText: hint,
    labelStyle: const TextStyle(
      color: MyColors.colorFunctional2,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: MyColors.colorFunctional2),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: MyColors.colorFunctional2),
      borderRadius: BorderRadius.circular(10),
    ),
    contentPadding: const EdgeInsets.all(10),
  );
}
