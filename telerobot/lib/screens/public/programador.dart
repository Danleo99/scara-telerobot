import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/widgets/programmer_grid.dart';
import '../../helpers/dash_controller.dart';

class Programador extends StatelessWidget {
  Programador({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 2,
          child: Center(child: ProgramingWidget()),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: size.height,
            margin: const EdgeInsets.fromLTRB(0, 0, 25, 10),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Funciones',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Obx(
                      () => ListView.builder(
                        itemCount: ctrl.points.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              ctrl.points[index],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.home),
                    label: const Text('Home'),
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        fixedSize: Size(size.width, 40),
                        primary: Colors.amber),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar Puntos'),
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        fixedSize: Size(size.width, 40),
                        primary: Colors.amber),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    label: const Text('Enviar'),
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        fixedSize: Size(size.width, 40),
                        primary: Colors.amber),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
