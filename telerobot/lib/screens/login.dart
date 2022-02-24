import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/helpers/responsive.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width:
              ResponsiveWidget.isMobile(context) ? 300 : screenSize.width / 1.5,
          height: ResponsiveWidget.isMobile(context) ? 500 : 700,
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('LOGIN',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Image.asset(
                    '/logos/telerobotSmWhite.png',
                    height: 120,
                  ),
                ],
              ),
              if (!ResponsiveWidget.isMobile(context))
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      '/logos/telerobotSmWhite.png',
                      width: 200,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
