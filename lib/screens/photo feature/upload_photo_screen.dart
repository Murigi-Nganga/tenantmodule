import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:tenantmodule/models/property_image.dart';
import 'package:tenantmodule/screens/photo%20feature/take_picture_screen.dart';
import 'package:tenantmodule/screens/photo%20feature/view_photo_screen.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  static const routeName = '/upload-photo';

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  File? _pickedFile;

  Future<void> _getImageFromGallery() async {
    try {
      XFile? pickedXFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        _pickedFile = File(pickedXFile!.path);
      });
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Info'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
          content: const Text('No image selected from gallery'),
        ),
      );
    }
  }

  void _takePicture(BuildContext context) async {
    try {
      final imageFile =
          await Navigator.of(context).pushNamed(TakePictureScreen.routeName);
      setState(() {
        _pickedFile = imageFile as File;
      });
    } catch (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Info'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
                content: const Text('No picture taken'),
              ));
    }
  }

  _submitPhoto(BuildContext context) async {
    if(_pickedFile == null) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Info'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
            content: const Text('No file selected for upload'),
          ),
        );
      }
      return;
    }

    const String username = "user";
    const String password = "pass";
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    final url = Uri.parse(
        'http://172.105.90.112:8080/smart-real-estate-backend/file/upload');

    final request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = basicAuth;
    request.files.add(await http.MultipartFile.fromPath('file', _pickedFile!.path));

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        // Navigate to the 'View Photo' screen with the data
        if(mounted) {
          Navigator.of(context).pushNamed(ViewPhotoScreen.routeName, arguments: {
            'propertyImage': PropertyImage.fromJson(responseBody)
          });
        }
      } else {
        if (mounted) {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Info'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
              content: const Text('No image selected from gallery'),
            ),
          );
        }
      }
    } catch (error){
      print(error);
      if (mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Info'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
            content: const Text('Something went wrong'),
          ),
        );
      }
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload photo')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Upload your image or take a picture',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  radius: 100,
                  backgroundImage:
                      _pickedFile == null ? null : FileImage(_pickedFile!),
                  child: _pickedFile == null
                      ? const Icon(
                          Icons.person_add_alt_1_rounded,
                          size: 40,
                          color: Colors.white,
                        )
                      : null,
                ),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: _getImageFromGallery,
                  child: const Text('Upload Image'),
                ),
                TextButton(
                  onPressed: () => _takePicture(context),
                  child: const Text('Take Picture'),
                ),
                TextButton(
                  onPressed: () => _submitPhoto(context),
                  child: const Text('Submit photo'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
