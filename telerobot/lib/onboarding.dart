import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helpers/auth_controller.dart';

class Onboarding extends StatelessWidget {
  Onboarding({Key? key}) : super(key: key);

  final onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/scara.png'),
              ),
            ),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
