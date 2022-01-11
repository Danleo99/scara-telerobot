import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telerobot/screens/mobile/widgets/robot_card.dart';

List _cards = [
  const RobotCard(
    robotImage: 'assets/images/abbMove.gif',
    brandName: 'ABB',
  ),
  const RobotCard(
    robotImage: 'assets/images/abbMove.gif',
    brandName: 'Thinker',
  ),
  const RobotCard(
    robotImage: 'assets/images/abbMove.gif',
    brandName: 'Turtle',
  )
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/logos/telerobotSmWhite.png',
                  height: 75,
                ),
              ),
              const Expanded(
                flex: 2,
                child: Text(
                  'Robots',
                  style: TextStyle(
                    fontSize: 70,
                    color: Colors.white,
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Icon(
                  CupertinoIcons.heart,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CarouselSlider.builder(
              itemCount: _cards.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Hero(tag: itemIndex, child: _cards[itemIndex]),
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 1.5),
            ),
          )
        ],
      ),
    );
  }
}
