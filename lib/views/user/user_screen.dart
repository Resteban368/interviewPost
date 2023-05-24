import 'package:flutter/material.dart';

import '../../widgets/appBar_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarTitle(context, 'User', false),
      body: Center(
        child: Text('UserScreen'),
      ),
    );
  }
}
