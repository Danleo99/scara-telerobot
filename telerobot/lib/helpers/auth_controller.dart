import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:telerobot/screens/mobile/login.dart';

class OnboardingController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      loadUser();
    });
    super.onInit();
  }
}

Future<void> loadUser() async {
  final _box = GetStorage();
  String _token = _box.read('apiToken') ?? '';

  debugPrint('enter to load');

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
      Get.to(const LogIn(), transition: Transition.downToUp);
    });
  }
}
