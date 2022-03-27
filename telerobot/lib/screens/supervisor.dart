import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/dash_controller.dart';

class Supervisor extends StatelessWidget {
  Supervisor({Key? key}) : super(key: key);
  final DashboardContoller ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Obx(
            () => Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: MemoryImage(base64Decode(ctrl.frameActual.value)),
                      fit: BoxFit.fill)),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(children: [
              const Text(
                'Control grados de libertad',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                  label: const Text('Home'),
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(), primary: Colors.amber),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar Puntos'),
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(), primary: Colors.amber),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                  label: const Text('Enviar'),
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(), primary: Colors.amber),
                ),
              )
            ]),
          ),
        )
      ],
    );
  }
}
