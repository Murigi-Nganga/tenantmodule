import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
  });

  static const routeName = '/take-picture';

  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final userCamera = cameras[0];
    _cameraController = CameraController(userCamera, ResolutionPreset.medium);
    return _cameraController.initialize();
  }

  void _takePicture(BuildContext context) async {
    try {
      await _initializeControllerFuture;
      final pictureFile = await _cameraController.takePicture();
      final image = File(pictureFile.path);
      if(mounted) {
        Navigator.of(context).pop(image);
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take Picture',)),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(children: [
              const SizedBox(height: 10),
              const Text(
                'Take a picture',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              CameraPreview(_cameraController),
            ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      floatingActionButton: SizedBox(
        height: 75.0,
        width: 75.0,
        child: FittedBox(
          child: FloatingActionButton(
            tooltip: 'Take a photo',
            onPressed: () => _takePicture(context),
            child: const Icon(Icons.camera_alt_rounded, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}