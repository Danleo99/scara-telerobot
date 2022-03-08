import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/dash_controller.dart';

class ProgramingWidget extends StatelessWidget {
  const ProgramingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                '0',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 250,
              ),
              Text(
                "Eje Y",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 250,
              ),
              Text(
                '450',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ProgrammingGrid(
            size: size,
          ),
        ),
      ],
    );
  }
}

class ProgrammingGrid extends StatelessWidget {
  final Size size;
  ProgrammingGrid({Key? key, required this.size}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 3,
      height: size.height,
      color: Colors.black,
      child: GridView.builder(
        itemCount: 900,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => ctrl.updatePoint(index),
          child: Obx(
            () => Container(
              color: ctrl.point[index] ? Colors.blue : Colors.white,
            ),
          ),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 30,
        ),
      ),
    );
  }
}
