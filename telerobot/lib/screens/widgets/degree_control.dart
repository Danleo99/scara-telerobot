import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/controllers/responsive.dart';
import '../../controllers/dash_controller.dart';

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
      child: Column(
        children: [
          if (!ResponsiveWidget.isMobile(context))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                '''Control Supervisado''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Cinematica Directa',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
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
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
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
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              'Cinematica Inversa',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text(
              'Movimiento lineal en X',
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
                    value: ctrl.xMove.value,
                    onChanged: (value) {
                      ctrl.xMove.value = value;
                    },
                    label: ctrl.xMove.value.round().toString(),
                    onChangeEnd: (value) {
                      ctrl.changeTCI();
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    '${ctrl.xMove.value.round()}',
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
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text(
              'Movimiento lineal en Y',
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
                    value: ctrl.yMove.value,
                    onChanged: (value) {
                      ctrl.yMove.value = value;
                    },
                    label: ctrl.yMove.value.round().toString(),
                    onChangeEnd: (value) {
                      ctrl.changeTCI();
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    '${ctrl.yMove.value.round()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          if (GetPlatform.isMobile)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 5, 20),
                    child: ElevatedButton.icon(
                      onPressed: () => ctrl.home(),
                      icon: const Icon(Icons.home),
                      label: const Text('Home'),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: Colors.amber,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 20, 20, 20),
                    child: ElevatedButton.icon(
                      onPressed: () => ctrl.reset(),
                      icon: const Icon(Icons.restart_alt_sharp),
                      label: const Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 5, 20),
            child: ElevatedButton.icon(
              onPressed: () => ctrl.uploadFile(),
              icon: const Icon(Icons.upload_file_rounded),
              label: const Text('Cargar Rutina'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.infinity, 40),
                shape: const StadiumBorder(),
                primary: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
