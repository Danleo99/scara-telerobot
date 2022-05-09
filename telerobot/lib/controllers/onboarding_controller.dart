import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:telerobot/constants/data_store.dart';
import 'package:telerobot/controllers/responsive.dart';
import 'package:telerobot/screens/login.dart';
import 'package:telerobot/screens/public/dashboard.dart';
import '../screens/mobile/mobile.dart';

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
  //final box = GetStorage();
  //final userData = box.read('user');
  const userData = null;
  if (userData != null) {
    final _user = User.fromJson(userData);
    String _token = _user.token;

    final url = Uri.parse("http://18.230.53.24:80/user");
    Map<String, String> headers = {"accessToken": _token};

    try {
      var res = await http.get(url, headers: headers);
      var statusCode = res.statusCode;
      if (statusCode != 202) {
        // box.remove('user');
        Get.offAll(() => LogIn());
      } else {
        Get.offAll(
          () => GetPlatform.isMobile
              ? MobileScreen()
              : ResponsiveWidget(
                  desktopScreen: DashBoard(),
                  mobileScreen: MobileScreen(),
                ),
        );
      }
    } catch (e) {
      Get.offAllNamed('/');
    }
  } else {
    Get.offAll(() => LogIn());
  }
}
