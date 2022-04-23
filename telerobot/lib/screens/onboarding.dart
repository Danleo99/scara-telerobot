import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/helpers/onboarding_controller.dart';

class Onboarding extends StatelessWidget {
  Onboarding({Key? key}) : super(key: key);

  final onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[200],
              image: const DecorationImage(
                image: AssetImage('images/scara.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
