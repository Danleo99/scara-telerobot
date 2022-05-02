import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../controllers/dash_controller.dart';

class ProgramingWidget extends StatefulWidget {
  const ProgramingWidget({Key? key}) : super(key: key);

  @override
  State<ProgramingWidget> createState() => _ProgramingWidgetState();
}

class _ProgramingWidgetState extends State<ProgramingWidget> {
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 25),
      height: size.height,
      color: const Color(0xff222222),
      child: SfCartesianChart(
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          ScatterSeries(
            onPointTap: (ChartPointDetails args) => setState(() {
              ctrl.updatePoint(args);
            }),
            name: 'Coordenada',
            enableTooltip: true,
            dataSource: ctrl.cSpace,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            markerSettings: const MarkerSettings(
              isVisible: true,
              borderColor: Colors.transparent,
              borderWidth: 0,
            ),
          ),
        ],
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Eje Y'),
          minimum: 0,
          maximum: 450,
          interval: 25,
        ),
        primaryXAxis: NumericAxis(
            title: AxisTitle(text: 'Eje X'),
            minimum: -450,
            maximum: 450,
            interval: 30,
            isInversed: true),
        backgroundColor: Colors.transparent,
        onMarkerRender: (args) {
          if (ctrl.cSpace[int.parse(args.pointIndex.toString())].selected ==
              false) {
            args.color = Colors.blue;
          } else {
            args.color = Colors.red;
          }
        },
      ),
    );
  }
}
