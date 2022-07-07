import 'package:flutter/material.dart';
import 'package:tenantmodule/screens/auth/log_in_screen.dart';

import '../../widgets/property_card.dart';

class OnboardingExploreScreen extends StatelessWidget {
  const OnboardingExploreScreen({Key? key}) : super(key: key);

  static const routeName = '/onboarding-explore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const PropertyCardWidget(),
          const PropertyCardWidget(),
          const SizedBox(height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, LogInScreen.routeName);
              },
              child: const Text('See More'),
            ),
          ),
        ],
      ),
    );
  }
}
