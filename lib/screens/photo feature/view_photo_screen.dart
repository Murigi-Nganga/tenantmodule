import 'package:flutter/material.dart';
import 'package:tenantmodule/models/property_image.dart';

class ViewPhotoScreen extends StatelessWidget {
  const ViewPhotoScreen({Key? key}) : super(key: key);

  static const routeName = '/view-photo';

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context)!.settings.arguments
        as Map<String, PropertyImage>;
    print(routeArguments);
    final PropertyImage propertyImage =
        routeArguments["propertyImage"] as PropertyImage;

    return Scaffold(
      appBar: AppBar(
        title: const Text('View photo'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
          RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Image Url: ',
          ),
          TextSpan(
            text: propertyImage.imageUrl,
            style: TextStyle(
            decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    ),
            const SizedBox(height: 10),
                      RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Image ID: ',
          ),
          TextSpan(
            text: '${propertyImage.imageId}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    ),
            const SizedBox(height: 30),
            Image.network(propertyImage.imageUrl),
          ],
        ),
      )),
    );
  }
}
