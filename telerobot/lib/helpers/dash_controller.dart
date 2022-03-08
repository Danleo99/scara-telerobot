import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket;
import 'package:telerobot/constants/data_store.dart';

class DashboardContoller extends GetxController {
  var active = 0.obs;
  var message = ''.obs;
  final box = GetStorage();
  var name = ''.obs;
  List point = List.generate(900, (index) => false).obs;

  socket.Socket client = socket.io(
    'http://localhost:5000',
    <String, dynamic>{
      'transports': ['websocket']
    },
  );

  @override
  void onInit() {
    connectSocket();
    //getUser();
    super.onInit();
  }

  void connectSocket() {
    // ignore: avoid_print
    client.onConnect((_) => {print('Connected to server')});
  }

  void sendMessage() {
    client.emit('/test', message.value);
    message.value = '';
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

  void updatePoint(index) {
    if (point[index] == false) {
      point[index] = true;
    } else {
      point[index] = false;
    }
  }
}
