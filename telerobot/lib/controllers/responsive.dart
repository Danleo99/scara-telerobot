import 'package:flutter/material.dart';

const int desktopScreenSize = 1366;
const int tabletScreenSize = 768;
const int mobileScreenSize = 360;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopScreen;
  final Widget? tabletScreen;
  final Widget mobileScreen;
  final Widget? customScreen;

  const ResponsiveWidget({
    Key? key,
    required this.desktopScreen,
    this.tabletScreen,
    required this.mobileScreen,
    this.customScreen,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletScreenSize;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletScreenSize &&
      MediaQuery.of(context).size.width < desktopScreenSize;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopScreenSize;

  static bool isCustom(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletScreenSize &&
      MediaQuery.of(context).size.width <= customScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if (_width >= desktopScreenSize) {
        return desktopScreen;
      } else if (_width < desktopScreenSize && _width >= tabletScreenSize) {
        return tabletScreen ?? desktopScreen;
      } else {
        return mobileScreen;
      }
    });
  }
}
