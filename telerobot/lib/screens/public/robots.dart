import 'package:flutter/material.dart';

class Robots extends StatelessWidget {
  const Robots({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RobotCard(robotImage: Image.asset('images/scara.png')),
              RobotCard(robotImage: Image.asset('images/abbMove.gif')),
              RobotCard(robotImage: Image.asset('images/scara.png')),
              const Card(child: Text('Coming soon')),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        )
      ],
    );
  }
}

class RobotCard extends StatelessWidget {
  final Image robotImage;
  const RobotCard({Key? key, required this.robotImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.red,
          child: SizedBox(
            height: 150,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Programar'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Supervisar'),
                )
              ],
            ),
          ),
        ),
        robotImage,
      ],
      alignment: AlignmentDirectional.bottomStart,
    );
  }
}
