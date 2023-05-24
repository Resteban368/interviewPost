// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/colors.dart';

AppBar appBarTitle(BuildContext context, String title, bool isBack) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
          color: MyColors.colorPrimary1,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    ),
    leading: isBack
        ? IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: MyColors.colorPrimary1,
            ),
            onPressed: () {
              GoRouter.of(context).go('/');
            })
        : null,
    elevation: 0,
    backgroundColor: Colors.white,
  );
}
