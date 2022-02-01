import 'package:flutter/material.dart';
import 'package:telerobot/helpers/responsive.dart';
import 'package:telerobot/screens/desktop/home.dart';
import 'package:telerobot/screens/mobile/mobile.dart';

class DesktopApp extends StatelessWidget {
  const DesktopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: const Home(),
      mobileScreen: MobileScreen(),
    );
  }
}
