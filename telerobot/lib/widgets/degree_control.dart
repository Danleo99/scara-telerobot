import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/dash_controller.dart';

class DegreeControl extends StatelessWidget {
  DegreeControl({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            '''Control grados de libertad''',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Primer grado de libertad',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Slider(
                  min: -90.0,
                  max: 90.0,
                  value: ctrl.fisrtDegree.value,
                  onChanged: (value) {
                    ctrl.fisrtDegree.value = value;
                  },
                  label: ctrl.fisrtDegree.value.round().toString(),
                  onChangeEnd: (value) {
                    ctrl.degreeChange();
                  },
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  '${ctrl.fisrtDegree.value.round()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Segundo grado de libertad',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Slider(
                  min: -115.0,
                  max: 115.0,
                  value: ctrl.secondDegree.value,
                  onChanged: (value) {
                    ctrl.secondDegree.value = value;
                  },
                  label: ctrl.secondDegree.value.round().toString(),
                  onChangeEnd: (value) {
                    ctrl.degreeChange();
                  },
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  '${ctrl.secondDegree.value.round()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton.icon(
                onPressed: () => ctrl.home(),
                icon: const Icon(Icons.home),
                label: const Text('Home'),
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(), primary: Colors.amber),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton.icon(
                onPressed: () => ctrl.reset(),
                icon: const Icon(Icons.home),
                label: const Text('Reset'),
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(), primary: Colors.amber),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
