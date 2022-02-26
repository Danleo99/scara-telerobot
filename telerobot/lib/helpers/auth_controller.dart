import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:telerobot/screens/login.dart';
import 'package:telerobot/screens/mobile/mobile.dart';

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

  final url = Uri.parse("http://192.168.0.10:3000/user");
  Map<String, String> headers = {"accessToken": _token};

  try {
    var res = await http.get(url, headers: headers);
    var statusCode = res.statusCode;
    if (statusCode != 202) {
      box.remove("apiToken");
      Get.offAll(() => const LogIn());
    } else {
      Get.offAll(() => MobileScreen());
    }
  } catch (e) {
    print(e);
  }
}
