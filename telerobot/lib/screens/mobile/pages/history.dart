import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dash_controller.dart';
import '../../widgets/degree_control.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DegreeControl());
  }
}
