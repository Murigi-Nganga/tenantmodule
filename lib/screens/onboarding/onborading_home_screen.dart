import 'package:flutter/material.dart';

import 'onboarding_explore_screen.dart';

class OnboardingHomeScreen extends StatelessWidget {
    const OnboardingHomeScreen({Key? key}) : super(key: key);

    static const routeName = '/onboarding-home';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            // appBar: null,
            body: Stack(
                fit: StackFit.expand,
                children: [
                Image.asset(
                'assets/images/homescreen_bg.jpg',
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.cover,
            ),
            SafeArea(
                child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 25, right: 25),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            Column(
                                children: [
                                Text(
                                     'Welcome To',
                        style: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.primary,
                        ),
                    ),
                    Text(
                        'Smart Real Estate',
                        style: TextStyle(
                            fontSize: 24,
                            color: Theme.of(context).colorScheme.secondary,
                        ),
                    ),]),
                    Image.asset(
                        'assets/images/flutter_image.png',
                        height: 70,
                        width: 70,
                    ),
                    Container(
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.secondary.withOpacity(.9),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                            "You're just one step away from your dream house. We can't wait for you to feel at home",
                            style: TextStyle(color: Colors.white),
                        ),
                    ),
                    ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                            backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary.withOpacity(.9)),
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
        ),
        ],
        ),
        );
    }
}
