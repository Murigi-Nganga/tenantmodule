import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// import '../providers/user_provider.dart';
import '../constants/app_theme.dart';
import '../models/property_owner.dart';
// import '../models/user.dart';

class PropertyOwnerProfileScreen extends StatelessWidget {
  const PropertyOwnerProfileScreen({Key? key}) : super(key: key);

  static const routeName = 'property-owner-profile-screen';

  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<UserProvider>(context).user as User;

    final routeArguments = ModalRoute.of(context)!.settings.arguments
        as Map<String, PropertyOwner>;
    final PropertyOwner propertyOwnerData =
        routeArguments['propertyOwnerData'] as PropertyOwner;

    return Scaffold(
        appBar: AppBar(title: const Text('Property Owner Details')),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(children: <Widget>[
            const CircleAvatar(
              //TODO: Add an image to the model
              backgroundColor: kBodyColor,
              backgroundImage: AssetImage('assets/images/background_image.jpg'),
              radius: 45,
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Icon(Icons.person_rounded),
                title: Text(propertyOwnerData.firstName),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.person_rounded),
                title: Text(propertyOwnerData.middleName),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.email_rounded),
                title: Text(propertyOwnerData.email),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone_rounded),
                title: Text('0${propertyOwnerData.phoneNumber}'),
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) {
                return GridView.count(
                  crossAxisCount: 2,
                  // crossAxisSpacing: 10,
                  // mainAxisSpacing: 10,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  children: [
                    InkWell(
                      onTap: () async {
                        // final to = propertyOwnerData.email;
                        // const subject = 'Important message';
                        // final  message = 'Message from ${user.firstName} ${user.middleName}';
                        // final url = Uri.parse('mailto:$to?subject=$subject&body=$message');
                        // if(await canLaunchUrl(url)){
                        //     await launchUrl(url);
                        // }
                      },
                      child: Card(
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.email_rounded,
                                color: Colors.redAccent,
                              ),
                              SizedBox(height: 5),
                              Text('Email')
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () async {
                        final phoneNumber = propertyOwnerData.phoneNumber;
                        final url = Uri.parse('tel:0$phoneNumber');

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      child: Card(
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.phone_enabled_rounded,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 5),
                              Text('Call')
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () async {
                        final phoneNumber = propertyOwnerData.phoneNumber;
                        final url = Uri.parse('sms:0$phoneNumber');

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      child: Card(
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.sms_rounded,
                                color: Colors.deepPurple,
                              ),
                              SizedBox(height: 5),
                              Text('SMS')
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () async {
                        final phoneNumber = propertyOwnerData.phoneNumber;
                        final url =
                            Uri.parse('whatsapp://send?phone=$phoneNumber');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      child: Card(
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                //TODO: Change to WhatsApp Icon later
                                Icons.adjust,
                                color: Colors.green,
                              ),
                              SizedBox(height: 5),
                              Text('WhatsApp')
                            ],
                          )),
                    ),
                  ],
                );
              },
            );
          },
          backgroundColor: kSecondaryColorDark,
          child: const Icon(
            Icons.phone_enabled_rounded,
            color: Colors.white,
          ),
        ));
  }
}
