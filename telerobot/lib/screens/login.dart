import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => Get.toNamed('/'),
      ),
      body: Container(
        child: Text('Log In Screen'),
      ),
    );
  }
}
