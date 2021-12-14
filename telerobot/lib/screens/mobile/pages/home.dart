import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(),
          Container(
            height: 120,
            color: Colors.red,
          ),
          Text('Hola perros'),
          Container(
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
