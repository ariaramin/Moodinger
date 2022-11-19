import 'package:flutter/material.dart';
import 'package:moodinger/constants/constants.dart';
import 'package:moodinger/screens/switch_account_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(milliseconds: 1800),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SwitchAccountScreen(),
            ),
            (route) => false);
      },
    );
    return Container(
      decoration: BoxDecoration(
        color: blackColor,
        image: DecorationImage(
          image: AssetImage("images/pattern.png"),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 104),
                child: Center(
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
              ),
              Positioned(
                bottom: 32,
                child: Column(
                  children: [
                    Text(
                      'From',
                      style: TextStyle(
                        fontFamily: "GB",
                        fontSize: 14,
                        color: greyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ExpertFlutter',
                      style: TextStyle(
                        fontFamily: "GB",
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
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
