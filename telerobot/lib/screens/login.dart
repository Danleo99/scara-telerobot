import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telerobot/helpers/login_controller.dart';
import 'package:telerobot/helpers/responsive.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  final controller = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var isDark = context.isDarkMode;

    return Scaffold(
      body: Center(
        child: Container(
          width: ResponsiveWidget.isMobile(context)
              ? screenSize.width * 0.8
              : screenSize.width / 1.5,
          height: ResponsiveWidget.isMobile(context)
              ? screenSize.height * 0.8
              : 700,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    if (ResponsiveWidget.isMobile(context))
                      Image.asset(
                        'images/telerobotSmWhite.png',
                        height: 120,
                      ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    // Email Container
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: double.infinity,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => controller.email.value = value,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.person),
                            hintText: 'anna@mail.com'),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white70),
                    ),
                    //Password Container
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      width: double.infinity,
                      child: TextField(
                        obscureText: true,
                        onChanged: (value) => controller.password.value = value,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.lock),
                          hintText: 'password',
                          suffixIcon: Icon(Icons.visibility),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    ElevatedButton(
                      onPressed: () => controller.login(),
                      child: const Text('LOGIN'),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          fixedSize: Size(screenSize.width * 0.25, 50),
                          primary: Colors.blueAccent),
                    )
                  ],
                ),
              ),
              if (!ResponsiveWidget.isMobile(context))
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/telerobotSmWhite.png',
                        width: screenSize.width * 0.2,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
