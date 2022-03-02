import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:telerobot/screens/public/dashboard.dart';

class LogInController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var url = Uri.parse('http://localhost:3000/user/login');
  final box = GetStorage();

  void login() async {
    Map<String, String> headers = {
      'email': email.toString(),
      'password': password.toString(),
    };
    try {
      var res = await http.get(url, headers: headers);
      if (res.statusCode == 202) {
        final user = jsonDecode(res.body);

        print(user);
        box.write('user', user);
        Get.to(() => DashBoard());
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
