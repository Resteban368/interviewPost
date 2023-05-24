// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../utils/colors.dart';

class InfouserBarra extends StatelessWidget {
  const InfouserBarra({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.width * 0.1,
          height: size.height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(99, 158, 158, 158),
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.person,
            color: Color.fromARGB(99, 158, 158, 158),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Name',
              style: TextStyle(
                color: MyColors.colorPrimaryNegro,
              ),
            ),
            Text(
              '15 min',
              style: TextStyle(color: MyColors.colorFunctional1, fontSize: 10),
            ),
          ],
        ),
        const Spacer(),
        //  btn circular de opciones

        GestureDetector(
          onTap: () {
            //mostramos un modal desde la parte inferior
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.colorFunctional2,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.more_horiz,
                size: 15, color: MyColors.colorPrimary2),
          ),
        ),
      ],
    );
  }
}
