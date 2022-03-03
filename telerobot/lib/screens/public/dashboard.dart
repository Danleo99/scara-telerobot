import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/helpers/dash_controller.dart';
import 'package:telerobot/screens/public/Robots.dart';
import 'package:telerobot/screens/public/programador.dart';
import 'package:telerobot/screens/public/widgets/sidebar.dart';
import 'package:telerobot/screens/rutinas.dart';

List<Widget> pages = [const Robots(), const Programador(), const Rutinas()];

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);
  final controller = Get.put(DashboardContoller());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SideBar(),
        ),
        Expanded(
          flex: 5,
          child: Obx(() => pages[controller.active.value]),
        ),
      ],
    );
  }
}
