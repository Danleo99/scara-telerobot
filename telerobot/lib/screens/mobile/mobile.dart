import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:telerobot/constants/style.dart';
import 'package:telerobot/screens/mobile/pages/history.dart';
import 'package:telerobot/screens/mobile/pages/home.dart';
import 'package:telerobot/screens/mobile/pages/settings.dart';

List pages = const [HistoryPage(), HomePage(), SettingsPage()];

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  var _active = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        color: darkTheme.primaryColor,
        backgroundColor: Colors.transparent,
        items: const [
          Icon(Icons.history),
          Icon(Icons.home),
          Icon(Icons.account_circle)
        ],
        onTap: (index) => setState(() => _active = index),
        animationDuration: const Duration(milliseconds: 250),
      ),
      body: pages[_active],
    );
  }
}
