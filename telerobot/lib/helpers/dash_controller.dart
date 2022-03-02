import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as client;

class DashboardContoller extends GetxController {
  var active = 0.obs;
  @override
  void onInit() {
    try {
      //final url = Uri.parse("http://172.27.1.35:3000/test");
      final socket = client.io("http://172.27.1.35:3000");
      socket.onConnect((_) {
        print('connect');
        socket.emit('msg', 'test');
      });
    } catch (e) {
      print(e);
    }
    super.onInit();
  }
}
