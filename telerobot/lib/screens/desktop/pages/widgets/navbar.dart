import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeleNavbar extends StatelessWidget implements PreferredSizeWidget {
  const TeleNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      color: const Color.fromARGB(255, 3, 21, 52),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: screenSize.width / 25),
          TextButton(
            child: Image.asset(
              'assets/logos/HorzBlue.png',
              color: Colors.white,
            ),
            onPressed: () => {Get.toNamed('/')},
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: const Text(
                    'Contacto',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () => {},
                ),
                const SizedBox(width: 60),
                ElevatedButton(
                  onPressed: () => Get.toNamed('/login'),
                  child: const Text('Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    fixedSize: const Size(100, kToolbarHeight * 0.7),
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(width: screenSize.width / 25),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}
