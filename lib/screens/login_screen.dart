import 'package:flutter/material.dart';
import 'package:moodinger/constants/constants.dart';
import 'package:moodinger/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 62,
              child: Column(
                children: [
                  Expanded(
                    child: Image(
                      image: AssetImage("images/rocket.png"),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: _getBottomContainer(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBottomContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blackColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sign in to",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  width: 6,
                ),
                Image(
                  image: AssetImage("images/mood.png"),
                ),
              ],
            ),
          ),
          _getTextFields(context),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? / ',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 16,
                ),
              ),
              Text(
                'Sign up',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _getTextFields(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          TextField(
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  width: 2,
                  color: greyColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  width: 2,
                  color: primaryColor,
                ),
              ),
              labelText: "Email",
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: TextStyle(
                fontFamily: "GB",
                fontSize: 20,
                color: primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 28,
          ),
          TextField(
            style: Theme.of(context).textTheme.bodyMedium,
            obscureText: true,
            // obscuringCharacter: "*",
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  width: 2,
                  color: greyColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  width: 2,
                  color: primaryColor,
                ),
              ),
              labelText: "Password",
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              floatingLabelStyle: TextStyle(
                fontFamily: "GB",
                fontSize: 20,
                color: primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 46,
          ),
          SizedBox(
            height: 46,
            width: 132,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (route) => false);
              },
              child: Text('Sign in'),
            ),
          ),
        ],
      ),
    );
  }
}
