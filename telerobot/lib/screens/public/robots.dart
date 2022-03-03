import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/helpers/dash_controller.dart';

class Robots extends StatelessWidget {
  const Robots({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardContoller());
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            // width: double.infinity,
            child: TextField(
              onChanged: (value) => controller.message.value = value,
              decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.lock),
                hintText: 'message',
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white70,
            ),
          ),
          ElevatedButton(
            onPressed: () => controller.sendMessage(),
            child: const Text('LOGIN'),
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(), primary: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
