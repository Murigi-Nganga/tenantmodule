import 'package:flutter/material.dart';

import '../constants/app_theme.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/property-details';

  //? Displayable properties
  //   this.unitID,
  //   this.unitCode,
  //   this.unitName,
  //   this.unitDescription,
  //   this.rentAmount,

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final propertyUnitData =
        routeArguments['propertyUnitData'];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Property Details'),
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
                  Text('Name of Property:   ${propertyUnitData.unitName}'),
                  // const SizedBox(height: 5),
                  // Text('Location:  ${propertyUnitData.propertyDescription}'),
                  const SizedBox(height: 5),
                  const Text('Property Type:  Apartment'),
                  const SizedBox(height: 10),
                  const Text('Description', style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10),
                  Text('${propertyUnitData.unitDescription}'),
                  const SizedBox(height: 20),
                  // Text(
                  //   'Features',
                  //   style: Theme.of(context).textTheme.subtitle1,
                  // ),
                  // Divider(
                  //   thickness: .8,
                  //   height: 10,
                  //   color: Theme.of(context).colorScheme.secondary,
                  // ),
                  // const SizedBox(height: 10),
                  // Text(houseFeatures),
                  const SizedBox(height: 20),
                  Text(
                      'Rent Amount: Ksh ${propertyUnitData.rentAmount}/month\n'),
                  const Text(
                    'Note: This price is exclusive of utilities eg. water, electricity etc.',
                    style: TextStyle(
                      color: kAccentColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Property Owner',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Divider(
                    thickness: .8,
                    height: 10,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(height: 15),
                  // PropertyOwnerCard(propertyOwnerData: {

                  // },),
                  const SizedBox(height: 10),
                  // propertyData.websiteUrl.isNotEmpty ? Text('For more information\n'
                  //     'visit ${propertyData.websiteUrl}',
                  //     style: TextStyle(
                  //         color: Theme.of(context).colorScheme.primary,
                  //         decoration: TextDecoration.underline),
                  // ): const Text("This has not been posted on a website yet"),
                ]),
              ),
            ],
          ),
        ));
  }
}
