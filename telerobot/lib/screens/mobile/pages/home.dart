import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/screens/widgets/notifications.dart';
import '../../../controllers/dash_controller.dart';
import '../../../controllers/theme_controller.dart';
import '../../widgets/robot_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final themeController = Get.put(ThemeController());
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    List _cards = [
      RobotCard(
        robotImage: 'images/scara.png',
        controller: ctrl.cardControllers[0],
        information:
            'El robot SCARA es un manipulador robótico que combina tres articulaciones angulares paralelas que le permiten moverse y orientarse en un plano con una articulación prismática que le permite mover el efector final de forma normal al plano.',
        logo: 'images/loog-eia.png',
      ),
      RobotCard(
        robotImage: 'images/abbMove.gif',
        controller: ctrl.cardControllers[1],
        information:
            'El ABB IRB140 es un robot industrial multiusos de seis ejes en el cual todas sus articulaciones son de tipo rotacional, este soporta una carga de 6kg con un alcance de 810mm.',
        logo: 'images/abb_logo.png',
      ),
      RobotCard(
        robotImage: 'images/baxter.png',
        controller: ctrl.cardControllers[1],
        information:
            'Baxter es un robot colaborativo desarrollado para el sector industrial por la empresa Rethink Robótica. Fue diseñado con una serie de sensores, cámaras y sistemas de control que le permite trabajar en un entorno cooperativo y adaptarse fácilmente a su espacio de trabajo.',
        logo: 'images/abb_logo.png',
      )
    ];
    return SafeArea(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  'images/telerobotSmWhite.png',
                  height: 75,
                ),
              ),
              const Expanded(
                flex: 2,
                child: Text(
                  'Robots',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const Expanded(flex: 1, child: NotificationIcon()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CarouselSlider.builder(
              itemCount: _cards.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Padding(
                          padding: const EdgeInsets.all(12),
                          child: _cards[itemIndex]),
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 1.3),
            ),
          )
        ],
      ),
    );
  }
}
