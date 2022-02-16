import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Container(
          height: kToolbarHeight,
          child: InkWell(
            child: Image.asset('assets/logos/telerobotColorDark.png'),
            onTap: () => {Get.toNamed('/')},
          ),
        ),
        iconTheme: IconThemeData(size: 100),
        backgroundColor: Color(0xAA202A44),
        actions: <Widget>[
          InkWell(
            child: const Text('Contacto'),
            onTap: () => {},
            onHover: (value) => {},
          ),
          const SizedBox(width: 12),
          InkWell(
            child: const Text('Log In'),
            onTap: () => {Get.toNamed('/login')},
            onHover: (value) => {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.amber),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Sistema de teleoperacion para robots de la Universidad EIA'),
                SizedBox(width: 50),
                Image.asset('assets/logos/telerobotColorDark.png',
                    width: MediaQuery.of(context).size.height / 2),
              ],
            ),
          )
        ],
      ),
    );
  }
}
