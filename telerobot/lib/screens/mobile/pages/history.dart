import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/screens/widgets/notifications.dart';
import '../../../controllers/dash_controller.dart';
import '../../widgets/degree_control.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
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
                'Control',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const Expanded(flex: 1, child: NotificationIcon()),
          ],
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: DegreeControl(),
        )),
      ],
    ));
  }
}
