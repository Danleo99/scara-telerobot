import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:telerobot/screens/login.dart';
import 'package:telerobot/screens/public/dashboard.dart';

class OnboardingController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1), () {
      loadUser();
    });
    super.onInit();
  }
}

Future<void> loadUser() async {
  final box = GetStorage();
  String _token = box.read("apiToken") ?? "";

  final url = Uri.parse("http://localhost:3000/user");
  Map<String, String> headers = {"accessToken": _token};

  try {
    var res = await http.get(url, headers: headers);
    var statusCode = res.statusCode;
    if (statusCode != 202) {
      box.remove("apiToken");
      Get.offAll(() => LogIn());
    } else {
      Get.offAll(() => DashBoard());
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
    Get.offAllNamed('/');
  }
}
