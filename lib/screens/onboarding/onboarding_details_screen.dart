import 'package:flutter/material.dart';
import 'package:tenantmodule/theme/app_theme.dart';
import 'package:tenantmodule/widgets/home_owner_card.dart';
import 'package:tenantmodule/widgets/unordered_items_list.dart';

class OnboardingDetailsScreen extends StatelessWidget {
  const OnboardingDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/onboarding-details';

  @override
  Widget build(BuildContext context) {
    const List<String> houseFeatures = [
      'Free WiFi',
      'Open Kitchen',
      '2 Bedrooms',
      'Air Conditioner'
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Property Details'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  'assets/images/homescreen_bg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(children: [
                  const Text('Name of Property:   Max Heights'),
                  const SizedBox(height: 5),
                  const Text('Location:  Buruburu'),
                  const SizedBox(height: 5),
                  const Text('Property Type:  Apartment House'),
                  const SizedBox(height: 20),
                  Text(
                    'Features',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Divider(
                    thickness: .8,
                    height: 10,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(height: 10),
                  const UnorderedItemsList(features: houseFeatures),
                  const SizedBox(height: 20),
                  const Text('Rent Amount: Ksh 50,000/ month\n'),
                  Text(
                    'Note: This price is exclusive of utilities eg. water, electricity etc.',
                    style: TextStyle(
                      color: appColors['AccentColor'],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Home Owner',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Divider(
                    thickness: .8,
                    height: 10,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(height: 15),
                  const HomeOwnerCard(),
                  const SizedBox(height: 20),
                  const Text('For more information'),
                  Text(
                    'visit www.max_heights.com',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
