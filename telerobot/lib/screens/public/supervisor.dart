import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/widgets/degree_control.dart';
import 'package:telerobot/widgets/video_feedback.dart';

class Supervisor extends StatelessWidget {
  const Supervisor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            child: GetPlatform.isMobile ? Container() : const VideoFeedback(),
          ),
        ),
        Expanded(flex: 1, child: DegreeControl())
      ],
    );
  }
}
