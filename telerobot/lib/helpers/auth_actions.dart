import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:telerobot/screens/login.dart';

// Load Action
Future<void> loadUser() async {
  final _box = GetStorage();
  String _token = _box.read('apiToken') ?? '';

  final url = Uri.parse('link');
  Map<String, String> headers = {
    'contextType': 'application/json',
    'signalToken': _token
  };

  Response res = await get(url, headers: headers);
  final statusCode = res.statusCode;

  if (statusCode != 200) {
    _box.remove('apiToken');

    Future.delayed(const Duration(seconds: 3), () {
      Get.to(const LogIn());
    });
  }
}
