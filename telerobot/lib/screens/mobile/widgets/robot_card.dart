import 'package:flutter/material.dart';

class RobotCard extends StatelessWidget {
  final String robotImage;
  final String brandName;
  const RobotCard({
    Key? key,
    required this.robotImage,
    required this.brandName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              Container(
                child: Text(brandName),
                height: 220,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
              ),
            ],
          ),
        ),
        Image.asset(robotImage)
      ],
    );
  }
}
