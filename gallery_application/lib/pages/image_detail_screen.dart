import 'package:flutter/material.dart';

import 'package:gallery_application/models/image_response_model.dart';

class ImageDetailScreen extends StatelessWidget {
  final Hit image;

  const ImageDetailScreen({required this.image, super.key});

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
            tag: image.previewUrl,
            child: Image.network(image.largeImageUrl),
          ),
        ),
      ),
    );
  }
}
