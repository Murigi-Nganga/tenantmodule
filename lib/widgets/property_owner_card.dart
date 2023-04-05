import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/user_provider.dart';
// import '../models/user.dart';
import '../constants/app_theme.dart';
import '../models/property_owner.dart';

class PropertyOwnerCard extends StatelessWidget {
  final PropertyOwner propertyOwnerData;

  const PropertyOwnerCard({Key? key, required this.propertyOwnerData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // User? user = Provider.of<UserProvider>(context).user;

    return InkWell(
      onTap: () {
        //  user == null ?
        // Navigator.pushNamed(context, LoginScreen.routeName) :
        // Navigator.pushNamed(
        //     context,
        //     PropertyOwnerProfileScreen.routeName,
        //     arguments: {'propertyOwnerData': propertyOwnerData}
        // );
        // print('Has been tapped!!');
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kPrimaryColorDark,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const CircleAvatar(
                  //TODO: Add an image to the model
                  backgroundImage:
                      AssetImage('assets/images/background_image.jpg'),
                  radius: 25,
                ),
                Text(
                  '${propertyOwnerData.firstName} ${propertyOwnerData.middleName}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
              ])),
    );
  }
}
