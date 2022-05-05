import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  const Text(
                    'Velocidad de movimiento',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DropdownButtonFormField<String>(
                      iconSize: 10,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        prefixIcon: FaIcon(FontAwesomeIcons.gaugeHigh),
                      ),
                      hint: const Text('100 (Default)'),
                      items: controller.speeds.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(
                            value.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.speedSelected = int.parse(value!);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Tooltip(
                      textStyle: const TextStyle(fontSize: 15),
                      message: 'Siempre a velocidad 100',
                      child: ElevatedButton.icon(
                        onPressed: () => controller.home(),
                        icon: const Icon(Icons.home),
                        label:
                            const Text('Home', style: TextStyle(fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.blueGrey,
                          fixedSize: Size(size.width, 40),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: ElevatedButton.icon(
                      onPressed: () => controller.reset(),
                      icon: const Icon(Icons.restart_alt_sharp),
                      label:
                          const Text('Reset', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: Colors.blueGrey,
                        fixedSize: Size(size.width, 40),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
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
