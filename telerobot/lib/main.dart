import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:telerobot/constants/style.dart';
import 'package:telerobot/onboarding.dart';
import 'package:telerobot/screens/desktop/pages/contact.dart';
import 'package:telerobot/screens/desktop/pages/desktop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final box = GetStorage();
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
      getPages: [
        GetPage(
          name: '/',
          page: () {
            return GetPlatform.isWeb ? Onboarding() : Onboarding();
          },
        ),
        GetPage(name: '/login', page: () => Onboarding()),
        GetPage(name: '/contactus', page: () => const ContactUs()),
        //GetPage(name: '/index', page: () => const Home())
      ],
    );
  }
}
