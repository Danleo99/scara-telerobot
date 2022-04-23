import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/widgets/degree_control.dart';

import '../../../helpers/dash_controller.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DegreeControl());
  }
}
