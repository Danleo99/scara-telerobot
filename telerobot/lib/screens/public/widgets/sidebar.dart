import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dash_controller.dart';

class SideBar extends StatelessWidget {
  SideBar({Key? key}) : super(key: key);
  final controller = Get.put(DashboardContoller());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                'images/telerobotSmWhite.png',
                width: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton.icon(
                onPressed: () => controller.active.value = 0,
                icon: const Icon(Icons.precision_manufacturing_sharp),
                label: const Text('Robots', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: controller.active.value == 0
                      ? Colors.amber
                      : Colors.blueGrey,
                  fixedSize: Size(size.width, 40),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton.icon(
                onPressed: () => controller.active.value = 1,
                icon: const Icon(Icons.apps_sharp),
                label:
                    const Text('Programador', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary: controller.active.value == 1
                        ? Colors.amber
                        : Colors.blueGrey,
                    fixedSize: Size(size.width, 40)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton.icon(
                onPressed: () => {
                  controller.active.value = 2,
                },
                icon: const Icon(Icons.camera_indoor_sharp),
                label: const Text('Supervisar', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: controller.active.value == 2
                      ? Colors.amber
                      : Colors.blueGrey,
                  fixedSize: Size(size.width, 40),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: ElevatedButton.icon(
                      onPressed: () => controller.logout(),
                      icon: const Icon(Icons.logout_outlined),
                      label:
                          const Text('Logout', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: Colors.blueGrey,
                        fixedSize: Size(size.width, 40),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
