import 'package:flutter/material.dart';
import 'package:telerobot/helpers/responsive.dart';
import 'package:telerobot/screens/desktop/pages/widgets/navbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: const TeleNavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenSize.height / 2,
              width: double.infinity,
              decoration: BoxDecoration(color: theme.primaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logos/telerobotColorDark.png',
                          width: screenSize.height / 2),
                      const Text(
                        "Sistema de teleoperacion para robots de la Universidad EIA",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  if (ResponsiveWidget.isDesktop(context))
                    Image.asset('assets/images/abbMove.gif',
                        width: screenSize.height / 1.5),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: screenSize.height / 2,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('dato1'),
                  Text('dato2'),
                  Text('dato3'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
