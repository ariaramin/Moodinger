import 'package:flutter/material.dart';
import 'package:moodinger/constants/constants.dart';
import 'package:moodinger/screens/splash_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontFamily: 'GB',
            fontSize: 12,
            color: whiteColor,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'GB',
            fontSize: 14,
            color: whiteColor,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'GB',
            fontSize: 20,
            color: whiteColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
