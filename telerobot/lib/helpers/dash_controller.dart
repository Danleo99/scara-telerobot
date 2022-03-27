import 'dart:math';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket;
import 'package:telerobot/constants/data_store.dart';

class ChartData {
  ChartData(this.x, this.y, this.selected);
  final int x;
  final int y;
  bool selected;
}

class DashboardContoller extends GetxController {
  // Controla que pantalla del dash esta activa
  var active = 0.obs;
  // Trae el usuario del almacenamiento
  final box = GetStorage();
  // Variable del nombre del usuario
  var name = ''.obs;
  // Lista de puntos seleccionados
  List points = [].obs;
  // Lista de posiciones x,y
  List<ChartData> cSpace = [
    for (var r = 245; r <= 450; r += 10)
      for (var th = 0; th <= 180; th += 2)
        ChartData((r * cos(th * (pi / 180))).round(),
            (r * sin(th * (pi / 180))).round(), false)
  ];
  // Frame a mostrar
  var frameActual = ''.obs;
  final cardControllers = [
    FlipCardController(),
    FlipCardController(),
    FlipCardController()
  ];

  socket.Socket client = socket.io(
    'http://localhost:5000',
    <String, dynamic>{
      'transports': ['websocket']
    },
  );

  @override
  void onInit() {
    //connectSocket();
    getUser();
    //getVideo();
    super.onInit();
  }

  void getVideo() {
    client.on('video', (frame) => {frameActual.value = frame});
  }

  void connectSocket() {
    // ignore: avoid_print
    client.onConnect((_) => {print('Connected to server')});
  }

  void runControl() {
    client.emit('python', ['COM6', 'configurar_codo']);
  }

  void logout() {
    try {
      box.remove('user');
      Get.offAllNamed('/');
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void getUser() {
    final userData = box.read('user');
    final _user = User.fromJson(userData);
    name.value = _user.name + ' ' + _user.lastname;
  }

  void updatePoint(args) {
    final punto = cSpace[int.parse(args.pointIndex.toString())];
    final onList = points.indexWhere((element) =>
        element ==
        'Punto (' + (punto.x).toString() + ',' + (punto.y).toString() + ')');
    if (onList == -1) {
      points.add(
          'Punto (' + (punto.x).toString() + ',' + (punto.y).toString() + ')');
    } else {
      points.removeAt(onList);
    }
    punto.selected = !punto.selected;
  }
}
