import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:telerobot/constants/style.dart';
import 'package:telerobot/screens/mobile/pages/history.dart';
import 'package:telerobot/screens/mobile/pages/home.dart';
import 'package:telerobot/screens/mobile/pages/settings.dart';
import 'package:get/get.dart';
import '../../controllers/dash_controller.dart';

List pages = [HistoryPage(), HomePage(), SettingsPage()];

class MobileScreen extends StatelessWidget {
  final controller = Get.put(DashboardContoller());
  final _active = 1.obs;
  MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        color: darkTheme.primaryColor,
        backgroundColor: Colors.transparent,
        items: const [
          Icon(Icons.camera_indoor),
          Icon(Icons.home),
          Icon(Icons.account_circle)
        ],
        onTap: (index) => _active.value = index,
        animationDuration: const Duration(milliseconds: 250),
      ),
      body: Obx(() => pages[_active.value]),
    );
  }
}
