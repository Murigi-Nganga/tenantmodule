import 'package:flutter/material.dart';

import '../screens/property_details_screen.dart';

//* Add 'Widget' to differentiate from PropertyCard model
class PropertyCardWidget extends StatelessWidget {
  const PropertyCardWidget({Key? key, required this.propertyUnitData})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final propertyUnitData;

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
            onTap: () {
              Navigator.pushNamed(context, PropertyDetailsScreen.routeName,
                  arguments: {'propertyUnitData': propertyUnitData});
            },
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        bottomLeft: Radius.circular(4.0)),
                    child: Image.asset(
                      //TODO: Add actual URL + Placeholder
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
                        // Text(
                        //   propertyUnitData.unitName!,
                        // ),
                        FittedBox(
                          child: Text(
                            'Rent : Ksh ${propertyUnitData.rentAmount}',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            const Icon(Icons.location_pin),
                            const SizedBox(
                              width: 10,
                            ),
                            // FittedBox(
                            //     child: Text(propertyUnitData.propertyCode!)),
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.king_bed),
                            SizedBox(
                              width: 10,
                            ),
                            Text('2 Bedrooms'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
