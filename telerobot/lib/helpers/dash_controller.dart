import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket;

class DashboardContoller extends GetxController {
  var active = 0.obs;
  var message = ''.obs;

  socket.Socket client = socket.io(
    'http://localhost:5000',
    <String, dynamic>{
      'transports': ['websocket']
    },
  );

  @override
  void onInit() {
    connectSocket();
    super.onInit();
  }

  void connectSocket() {
    client.onConnect((_) => {print('Connected to server')});
  }

  void sendMessage() {
    client.emit('/test', message.value);
    message.value = '';
  }
}
