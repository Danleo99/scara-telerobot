import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/widgets/programmer_grid.dart';
import '../../helpers/dash_controller.dart';

class Programador extends StatelessWidget {
  Programador({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
          child: Text(
            'Programador',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: Center(child: ProgramingWidget()),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 600,
                margin: const EdgeInsets.only(right: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber,
                ),
                child: Column(children: [
                  Text('Funciones'),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.new_releases_sharp),
                    label: Text('Guardar Puntos'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => ctrl.runControl('HolaMundo'),
                    icon: Icon(Icons.new_releases_sharp),
                    label: Text('Enviar'),
                  )
                ]),
              ),
            )
          ],
        ),
      ],
    );
  }
}
