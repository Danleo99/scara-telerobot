import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/controllers/dash_controller.dart';
import 'package:telerobot/screens/widgets/notifications.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  'images/telerobotSmWhite.png',
                  height: 75,
                ),
              ),
              const Expanded(
                flex: 2,
                child: Text(
                  'Cuenta',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const Expanded(flex: 1, child: NotificationIcon()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: () => ctrl.logout(),
              icon: const Icon(Icons.logout_outlined),
              label: const Text('Logout', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: Colors.blueGrey,
                fixedSize: Size(size.width, 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
