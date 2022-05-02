import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dash_controller.dart';
import '../../widgets/notifications.dart';

List<String> pages = ['Robots', 'Programador', 'Supervisor'];

class DashNavbar extends StatelessWidget implements PreferredSizeWidget {
  DashNavbar({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 10, 20, 10),
      child: Row(
        children: [
          Obx(
            () => Text(
              pages[ctrl.active.value],
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const NotificationIcon(),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  color: Colors.white,
                  width: 1,
                  height: 15,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  ctrl.name.value,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('images/daniel.jpg'),
                  radius: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
