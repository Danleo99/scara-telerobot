import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/dash_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProgramingWidget extends StatelessWidget {
  ProgramingWidget({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      height: size.height,
      color: const Color(0xff222222),
      child: SfCartesianChart(
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 450,
          interval: 25,
        ),
        primaryXAxis: NumericAxis(
          minimum: -225,
          maximum: 225,
          interval: 25,
        ),
        backgroundColor: Colors.transparent,
        onChartTouchInteractionDown: (args) => print(
            args.position.dx.toString() + ',' + args.position.dy.toString()),
      ),
    );
  }
}
