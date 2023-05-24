// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:interview/utils/colors.dart';

class MainNavigator extends StatelessWidget {
  final Widget child;
  final int selectIndex;

  const MainNavigator(
      {super.key, required this.child, required this.selectIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: child,
      bottomNavigationBar: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: CustomNavigationBar(
          iconSize: 27.0,
          // bubbleCurve: Curves.bounceIn,
          selectedColor: MyColors.colorPrimary1,
          strokeColor: MyColors.colorPrimary1,
          unSelectedColor: MyColors.colorPrimary1,
          backgroundColor: Color.fromARGB(255, 250, 249, 249),
          // scaleFactor: 0.4,
          // bordes solo en la parte superior
          // borderRadius: Radius.circular(15),

          // elevation: 10.0,
          items: [
            CustomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Discover',
                  style: TextStyle(fontSize: 9, color: MyColors.colorPrimary1)),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.file_copy),
              title: Text('Post',
                  style: TextStyle(fontSize: 9, color: MyColors.colorPrimary1)),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              title: Text('Shop',
                  style: TextStyle(fontSize: 9, color: MyColors.colorPrimary1)),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Porfile',
                  style: TextStyle(fontSize: 9, color: MyColors.colorPrimary1)),
            ),
          ],
          onTap: (selectIndex) {
            if (selectIndex == 0) {
              GoRouter.of(context).go('/');
            }
            if (selectIndex == 1) {
              GoRouter.of(context).go('/addPost');
            }
            if (selectIndex == 2) {
              GoRouter.of(context).go('/shop');
            }
            if (selectIndex == 3) {
              GoRouter.of(context).go('/User');
            }
          },
          currentIndex: selectIndex,
        ),
      ),
    );
  }
}
