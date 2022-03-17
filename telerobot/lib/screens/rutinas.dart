import 'package:flutter/material.dart';

class Rutinas extends StatelessWidget {
  const Rutinas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
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
