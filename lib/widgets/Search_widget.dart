// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:interview/utils/colors.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        border: Border.all(
          color: MyColors.colorFunctional2,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search Users",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              size: 30,
              color: MyColors.colorPrimary1,
            ),
          ),
        ),
      ),
    );
  }
}
