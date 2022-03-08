import 'package:flutter/material.dart';

class Robots extends StatelessWidget {
  const Robots({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
          child: Text(
            'Robots',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Card(
                    color: Colors.red,
                    child: SizedBox(
                      height: 150,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Programar'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Supervisar'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Image.asset('images/scara.png'),
                ],
                alignment: AlignmentDirectional.bottomStart,
              ),
              Stack(
                children: [
                  Card(
                    color: Colors.red,
                    child: SizedBox(
                      height: 150,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Programar'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Supervisar'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Image.asset('images/abbMove.gif'),
                ],
                alignment: AlignmentDirectional.bottomStart,
              ),
              Stack(
                children: [
                  Card(
                    color: Colors.red,
                    child: SizedBox(
                      height: 150,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Programar'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Supervisar'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Image.asset('images/scara.png'),
                ],
                alignment: AlignmentDirectional.bottomStart,
              ),
              Card(
                child: const Text('Coming soon'),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Card(
            color: Colors.blue,
            child: SizedBox(width: size.width),
          ),
        )
      ],
    );
  }
}
