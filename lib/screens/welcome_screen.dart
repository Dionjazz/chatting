import 'package:chatting/screens/login_screen.dart';
import 'package:chatting/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatting/componets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
      upperBound: 1,
    );

    animation = ColorTween(begin: Colors.lightGreenAccent, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: SizedBox(
                      child: Image.asset('images/logo.png'),
                      height: 60,
                    ),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: const Duration(milliseconds: 100),
                  text: ['Flash Chat'],
                  textStyle: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                text: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                text: 'Register',
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
