import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

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

  //final url = Uri.parse('http://localhost:3000/user/login');
  Map<String, String> headers = {
    'contextType': 'application/json',
    'signalToken': _token
  };

  //var res = await http.get(url, headers: headers);
  //var statusCode = res.statusCode;
  //debugPrint(res.statusCode.toString());
  final statusCode = 400;

  if (statusCode != 200) {
    _box.remove('apiToken');

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/login');
    });
  }
}
