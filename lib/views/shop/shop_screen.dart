import 'package:flutter/material.dart';

import '../../widgets/appBar_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarTitle(context, 'ShopScreen', false),
      body: const Center(
        child: Text('ShopScreen'),
      ),
    );
  }
}
