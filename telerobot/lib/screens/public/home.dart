import 'package:flutter/material.dart';
import 'package:telerobot/screens/public/widgets/navbar.dart';
import '../../controllers/responsive.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return RawKeyboardListener(
      autofocus: false,
      focusNode: FocusNode(),
      child: Scaffold(
        appBar: const TeleNavbar(),
        body: Column(
          children: [
            Container(
              height: screenSize.height / 2,
              width: double.infinity,
              color: theme.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/telerobotColorDark.png',
                          width: screenSize.height / 2),
                      const Text(
                        "Sistema de teleoperacion para robots de la Universidad EIA",
                        style: TextStyle(fontSize: 25, color: Colors.white70),
                      ),
                    ],
                  ),
                  if (ResponsiveWidget.isDesktop(context))
                    Image.asset('images/abbMove.gif',
                        width: screenSize.height / 1.5),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: screenSize.height / 2.5,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    'Descubre lo que puedes hacer con Telerobot !',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'images/clock.gif',
                            width:
                                ResponsiveWidget.isDesktop(context) ? 150 : 100,
                            color: const Color.fromARGB(255, 119, 140, 160),
                          ),
                          const Text(
                            'Comunicacion de baja latencia',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'images/rocket.gif',
                            width:
                                ResponsiveWidget.isDesktop(context) ? 150 : 100,
                            color: const Color.fromARGB(255, 119, 140, 160),
                          ),
                          const Text(
                            'Control robotico supervisado ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'images/world.gif',
                            width:
                                ResponsiveWidget.isDesktop(context) ? 150 : 100,
                            color: const Color.fromARGB(255, 119, 140, 160),
                          ),
                          const Text(
                            'Programacion a distancia',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
