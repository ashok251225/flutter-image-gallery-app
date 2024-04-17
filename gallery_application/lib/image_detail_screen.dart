import 'package:flutter/material.dart';
import 'package:gallery_application/image_model.dart';

class ImageDetailScreen extends StatelessWidget {
  final ImageModel image;

  ImageDetailScreen({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Detail'),
      ),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: image.url,
            child: Image.network(image.url),
          ),
        ),
      ),
    );
  }
}
