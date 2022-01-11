import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/constants/style.dart';
import 'package:telerobot/helpers/responsive.dart';
import 'package:telerobot/screens/desktop/desktop.dart';
import 'package:telerobot/screens/mobile/mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      title: 'Telerobot',
      home: ResponsiveWidget(
        desktopScreen: DesktopApp(),
        mobileScreen: MobileScreen(),
      ),
    );
  }
}
