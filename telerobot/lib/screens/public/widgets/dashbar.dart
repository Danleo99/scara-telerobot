import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/dash_controller.dart';

class DashNavbar extends StatelessWidget implements PreferredSizeWidget {
  DashNavbar({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
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
          CircleAvatar(
            backgroundImage: AssetImage('images/daniel.jpg'),
            radius: 20,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
