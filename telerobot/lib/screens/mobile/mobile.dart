import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:telerobot/constants/style.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkTheme.backgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        color: darkTheme.backgroundColor,
        backgroundColor: darkTheme.primaryColor,
        items: const [
          Icon(Icons.history),
          Icon(Icons.home),
          Icon(Icons.account_circle)
        ],
        onTap: (index) {},
        animationDuration: const Duration(milliseconds: 250),
      ),
      body: const Text('Hola Mundo'),
    );
  }
}
