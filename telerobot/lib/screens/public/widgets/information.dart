import 'package:flutter/material.dart';

class SoftwareInformation extends StatelessWidget {
  const SoftwareInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Bienvenido a Telerobot',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 20, 30, 20),
                    child: Icon(
                      Icons.assignment_rounded,
                      size: 50,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        'Este sistema te permite conectar, controlar y programar robots de la EIA desde dispositivos conectados a internet',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 20, 30, 20),
                    child: Icon(
                      Icons.apps_sharp,
                      size: 50,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        'Para generar una rutina puedes ir a la pagina de programador y escoger los puntos por donde se desea que pase el robot, para luego ser guardada en una base de datos o ser enviada a ejecucion',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 20, 30, 20),
                    child: Icon(
                      Icons.camera_indoor_sharp,
                      size: 50,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        'Si se desea hacer un control supervisado se ingrasar a la seccion de supervisar donde se tiene una retroalimentacion del robot pot video y se pueden controlar los grados de libertad individualmente',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
