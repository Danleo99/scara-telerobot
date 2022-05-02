import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/screens/public/widgets/information.dart';
import '../../controllers/dash_controller.dart';
import '../widgets/robot_card.dart';

class Robots extends StatelessWidget {
  Robots({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const SoftwareInformation()),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Estado de Conexion',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.laptop_sharp,
                            size: 50,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 50,
                          ),
                          Icon(
                            Icons.precision_manufacturing,
                            size: 50,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                controller: ctrl.cardControllers[2],
                information:
                    'Baxter es un robot colaborativo desarrollado para el sector industrial por la empresa Rethink Robótica. Fue diseñado con una serie de sensores, cámaras y sistemas de control que le permite trabajar en un entorno cooperativo y adaptarse fácilmente a su espacio de trabajo.',
                logo: 'images/baxterLogo.png',
              )
            ],
          ),
        ),
      ],
    );
  }
}
