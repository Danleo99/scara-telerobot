import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:get/get.dart';
import 'package:telerobot/screens/public/widgets/information.dart';
import '../../helpers/dash_controller.dart';

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
              ),
              RobotCard(
                robotImage: 'images/abbMove.gif',
                controller: ctrl.cardControllers[1],
              ),
              RobotCard(
                robotImage: 'images/baxter.png',
                controller: ctrl.cardControllers[2],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class RobotCard extends StatelessWidget {
  const RobotCard(
      {Key? key, required this.robotImage, required this.controller})
      : super(key: key);
  final String robotImage;
  final FlipCardController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onVerticalDragEnd: (d) => controller.toggleCard(),
      onTap: () => controller.toggleCard(),
      child: FlipCard(
        fill: Fill.fillBack,
        controller: controller,
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          width: size.width,
          height: size.height / 3.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(robotImage),
                ),
                height: size.height / 4.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.keyboard_backspace),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Mas informacion',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Icon(Icons.info_outline)
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        back: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [Text('back'), Text('data')],
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
