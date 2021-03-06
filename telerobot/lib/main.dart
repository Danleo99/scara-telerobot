import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:telerobot/constants/style.dart';
import 'package:telerobot/controllers/responsive.dart';
import 'package:telerobot/screens/login.dart';
//import 'package:telerobot/screens/mobile/mobile.dart';
import 'package:telerobot/screens/onboarding.dart';
import 'package:telerobot/screens/public/contact.dart';
//import 'package:telerobot/screens/public/dashboard.dart';
import 'screens/public/home.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;

void main() async {
  ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
    final frame = html.IFrameElement();
    frame.src =
        'https://www.youtube.com/embed/live_stream?channel=UCsjmIfPcJH7GhWXmGX_y0Gw';
    frame.style.border = 'none';
    frame.allowFullscreen = true;
    frame.height = '300';
    frame.width = '500';
    return frame;
  });
  await GetStorage.init();
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
            page: () => GetPlatform.isMobile
                ? Onboarding() //: DashBoard(),
                : ResponsiveWidget(
                    desktopScreen: const Home(), mobileScreen: LogIn()),
            transition: Transition.leftToRight),
        GetPage(
          name: '/login',
          page: () => Onboarding(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          middlewares: [GetMiddleware()],
          name: '/contactus',
          page: () => ResponsiveWidget(
              desktopScreen: const ContactUs(), mobileScreen: LogIn()),
          transition: Transition.rightToLeft,
        ),
      ],
    );
  }
}
