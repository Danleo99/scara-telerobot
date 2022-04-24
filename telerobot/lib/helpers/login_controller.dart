import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:telerobot/helpers/responsive.dart';
import 'package:telerobot/screens/mobile/mobile.dart';
import 'package:telerobot/screens/public/dashboard.dart';

class LogInController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var url = Uri.parse('http://18.230.53.24:443/user/login');
  final box = GetStorage();

  void login() async {
    Map<String, String> headers = {
      'email': email.value.toString(),
      'password': password.value.toString(),
    };
    try {
      var res = await http.get(url, headers: headers);
      if (res.statusCode == 202) {
        final userData = jsonDecode(res.body);
        box.write('user', userData);
        Get.to(
          () => GetPlatform.isMobile
              ? MobileScreen()
              : ResponsiveWidget(
                  desktopScreen: DashBoard(),
                  mobileScreen: MobileScreen(),
                ),
        );
      } else {
        // ignore: avoid_print
        print('Username or password not valid');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
