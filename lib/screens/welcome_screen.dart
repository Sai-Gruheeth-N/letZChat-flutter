import 'package:flutter/material.dart';
import 'package:letzchat_flutter/screens/login_screen.dart';
import 'package:letzchat_flutter/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:letzchat_flutter/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
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
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
      upperBound: 1.0,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: animation.value * 90,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        speed: const Duration(milliseconds: 250),
                        'LetZChat',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Flexible(
              child: Hero(
                tag: 'login',
                child: RoundedButton(
                  colour: Colors.lightBlueAccent,
                  title: 'Log In',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ),
            ),
            Flexible(
              child: Hero(
                tag: 'registration',
                child: RoundedButton(
                  colour: Colors.blueAccent,
                  title: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) {
//       return LoginScreen();
//     },
//   ),
// );

// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) {
//       return RegistrationScreen();
//     },
//   ),
// );

// Text(
//   'LetZChat',
//   style: TextStyle(
//     color: Colors.blueGrey[900],
//     fontSize: 45.0,
//     fontWeight: FontWeight.w900,
//   ),
// ),

// controller.reverse(from: 1.0);

// controller.addStatusListener((status) {
//   // print(status);
//   if (status == AnimationStatus.completed) {
//     controller.reverse(from: 1.0);
//   } else if (status == AnimationStatus.dismissed) {
//     controller.forward();
//   }
// });

// animation =
//     ColorTween(begin: Colors.black, end: Colors.white).animate(controller);
