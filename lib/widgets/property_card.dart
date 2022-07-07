import 'package:flutter/material.dart';

import '../screens/onboarding/onboarding_details_screen.dart';

class PropertyCardWidget extends StatelessWidget {
  const PropertyCardWidget({Key? key, 
  // required this.propertyData
  }) : super(key: key);

  // final List propertyData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * .02),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, OnboardingDetailsScreen.routeName);
          },
          child: Row(children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), bottomLeft: Radius.circular(4.0)),
                child: Image.asset(
                  'assets/images/homescreen_bg.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                        'Max Heights',),
                   const  Text(
                        'Apartment Room',),
                    const SizedBox(height: 10,),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.location_pin),
                        SizedBox(width: 10,),
                        FittedBox(child: Text('Buruburu, Nairobi')),
                      ],
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.king_bed),
                        SizedBox(width: 10,),
                        Text('2 Bedrooms'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],),
        )
      ),
    );
  }
}


