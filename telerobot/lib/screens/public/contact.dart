import 'package:flutter/material.dart';
import 'package:telerobot/screens/public/widgets/navbar.dart';
import 'package:telerobot/screens/public/widgets/photo_card.dart';

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
                    Container(
                      color: Colors.grey,
                      width: 1,
                      height: 300,
                    ),
                    const PhotoCard(
                      title: 'Nuestro director',
                      photo: 'assets/images/puerta.jpg',
                      name: 'Alejandro Puerta',
                      link:
                          'https://www.linkedin.com/in/alejandro-puerta-echand%C3%ADa-151b6ab5/',
                    ),
                    const PhotoCard(
                      photo: 'assets/images/tejada.jpg',
                      name: 'Juan Camilo Tejada',
                      link:
                          'https://www.linkedin.com/in/juan-camilo-tejada-orjuela-282686206/',
                    )
                  ],
                ),
              ),
              Container(
                height: screenSize.height / 3,
                width: double.infinity,
                child: Row(
                  children: const [
                    Text('Contactanos'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
