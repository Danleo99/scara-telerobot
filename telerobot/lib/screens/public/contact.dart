import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telerobot/controllers/responsive.dart';
import 'package:telerobot/screens/public/widgets/navbar.dart';
import 'package:telerobot/screens/public/widgets/photo_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: false,
      child: Scaffold(
        appBar: const TeleNavbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenSize.height / 1.9,
                color: theme.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const PhotoCard(
                      title: 'Conoce nuestro equipo',
                      photo: 'images/santiago.jpg',
                      name: 'Andres Santiago Lopez Echavarria',
                      link:
                          'https://www.linkedin.com/in/andrés-santiago-lópez-echavarría-6826821a1/',
                    ),
                    const PhotoCard(
                      photo: 'images/daniel.jpg',
                      name: 'Daniel Felipe Leon Gualdron',
                      link:
                          'https://www.linkedin.com/in/daniel-leon-28b104167/',
                    ),
                    if (ResponsiveWidget.isDesktop(context))
                      Container(
                        color: Colors.grey,
                        width: 1,
                        height: 300,
                      ),
                    if (ResponsiveWidget.isDesktop(context))
                      const PhotoCard(
                        title: 'Nuestro director',
                        photo: 'images/puerta.jpg',
                        name: 'Alejandro Puerta',
                        link:
                            'https://www.linkedin.com/in/alejandro-puerta-echand%C3%ADa-151b6ab5/',
                      ),
                    if (ResponsiveWidget.isDesktop(context))
                      const PhotoCard(
                        photo: 'images/tejada.jpg',
                        name: 'Juan Camilo Tejada',
                        link:
                            'https://www.linkedin.com/in/juan-camilo-tejada-orjuela-282686206/',
                      )
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height / 3,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: const FaIcon(
                        FontAwesomeIcons.github,
                        size: 100,
                      ),
                      onTap: () =>
                          launch('https://github.com/Danleo99/scara-telerobot'),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      'Para mas informacion nos pueden contactar por GitHub donde se encuentra todo el codigo del programa.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
