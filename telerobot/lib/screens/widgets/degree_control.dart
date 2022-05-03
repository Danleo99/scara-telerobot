import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
          // SizedBox(
          //   height: 300,
          //   child: Container(
          //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          //     decoration: BoxDecoration(
          //       border: Border.all(width: 1, color: Colors.white),
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: Obx(
          //       () => ListView.builder(
          //         itemCount: ctrl.selectedByDegree.length,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text(
          //               ctrl.selectedByDegree[index],
          //               style: const TextStyle(
          //                 color: Colors.white,
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   ),
          // ),
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
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          //   child: ElevatedButton.icon(
          //     onPressed: () => ctrl.TCD_scara(),
          //     icon: const Icon(Icons.add_circle_sharp),
          //     label: const Text('Set point'),
          //     style: ElevatedButton.styleFrom(
          //         shape: const StadiumBorder(),
          //         primary: Colors.amber,
          //         fixedSize: Size(MediaQuery.of(context).size.width, 40)),
          //   ),
          // ),
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
        ],
      ),
    );
  }
}
