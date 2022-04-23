import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

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
