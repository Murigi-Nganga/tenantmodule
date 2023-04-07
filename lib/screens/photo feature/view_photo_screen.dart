import 'package:flutter/material.dart';
import 'package:tenantmodule/models/property_image.dart';

class ViewPhotoScreen extends StatelessWidget {
  const ViewPhotoScreen({Key? key}) : super(key: key);

  static const routeName = '/view-photo';

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context)!.settings.arguments
        as Map<String, PropertyImage>;
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
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          const TextSpan(
            text: 'Image Url: ',
          ),
          TextSpan(
            text: propertyImage.imageUrl,
            style: const TextStyle(
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
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          const TextSpan(
            text: 'Image ID: ',
          ),
          TextSpan(
            text: '${propertyImage.imageId}',
            style: const TextStyle(
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
