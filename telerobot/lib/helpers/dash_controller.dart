import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket;
import 'package:telerobot/constants/data_store.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final int y;
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
  List generatePoints() {
    List points = [];
    for (var i = 245; i == 450; i + 5) {
      for (var j = 0; j == 450; j + 5) {
        print(i);
        points.add(ChartData(i, j));
      }
    }
    return points;
  }

  socket.Socket client = socket.io(
    'http://localhost:5000',
    <String, dynamic>{
      'transports': ['websocket']
    },
  );

  @override
  void onInit() {
    generatePoints();
    //connectSocket();
    //getUser();
    super.onInit();
  }

  void connectSocket() {
    // ignore: avoid_print
    client.onConnect((_) => {print('Connected to server')});
  }

  void runControl(action) {
    client.emit('/python', action);
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

  void updatePoint(index) {}
}
