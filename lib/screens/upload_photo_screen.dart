import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

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
      showDialog(context: context, builder: (BuildContext context) => AlertDialog(
        title: const Text('Info'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
        content: const Text('No image selected from gallery'),
      ));
    }
  }

  _submitPhoto() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 70),
          child: Column(
            children: [
              const Text(
                'Upload your image or take a photo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                radius: 100,
                backgroundImage: _pickedFile == null ? null : FileImage(_pickedFile!),
                child: _pickedFile == null
                    ? const Icon(
                  Icons.person_add_alt_1_rounded,
                  size: 40,
                  color: Colors.white,
                ) : null,
              ),
              const SizedBox(height: 40),
              TextButton(onPressed: _getImageFromGallery,child: const Text('Upload Image'),),
              TextButton(onPressed: _getImageFromGallery, child: const Text('Take Picture'),),
              TextButton(onPressed: _submitPhoto, child: const Text('Submit photo'),),
            ],
          ),
        ),
      ),
    );
  }
}