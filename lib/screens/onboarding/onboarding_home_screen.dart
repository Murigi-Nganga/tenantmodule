import 'package:flutter/material.dart';

import '../../constants/app_theme.dart';
import './onboarding_explore_screen.dart';

class OnboardingHomeScreen extends StatelessWidget {
  const OnboardingHomeScreen({Key? key}) : super(key: key);

  static const routeName = '/onboarding-home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 148, 196, 219),
                  Color.fromARGB(215, 210, 233, 165)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: const [
                  Text(
                    'Welcome To',
                    style: TextStyle(
                        fontSize: 22,
                        color: kPrimaryColorDark,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Smart Real Estate',
                    style: TextStyle(
                        fontSize: 24,
                        color: kSecondaryColorDark,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
                Image.asset(
                  'assets/images/flutter_image.png',
                  height: 70,
                  width: 70,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(.9),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "You're just one step away from your dream house. We can't wait for you to feel at home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(.9)),
                      ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, OnboardingExploreScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text('Get Started'),
                      Icon(Icons.keyboard_arrow_right_rounded)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
