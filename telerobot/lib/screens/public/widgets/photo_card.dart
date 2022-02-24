import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:telerobot/helpers/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class PhotoCard extends StatelessWidget {
  final String photo;
  final String name;
  final String link;
  final String title;
  const PhotoCard({
    Key? key,
    required this.photo,
    required this.name,
    this.link = '',
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = ResponsiveWidget.isTablet(context) ? 200 : 250;

    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: ResponsiveWidget.isTablet(context) ? 25 : 40,
            color: Colors.white70,
          ),
          textAlign: TextAlign.left,
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(top: 10),
          height: 300,
          width: _width,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(photo),
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        ),
        Container(
          padding: const EdgeInsetsDirectional.all(5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 119, 140, 160),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          width: _width,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: _width * 0.8,
                child: Text(
                  name,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
              InkWell(
                child: const FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: Colors.black,
                ),
                onTap: () => launch(link),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
