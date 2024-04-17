import 'package:flutter/material.dart';
import 'package:gallery_application/pages/image_detail_screen.dart';

import 'package:gallery_application/models/image_response_model.dart';

class ImageTile extends StatelessWidget {
  final Hit image;

  const ImageTile({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ImageDetailScreen(image: image);
        }));
      },
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text('Likes: ${image.likes}, Views: ${image.views}'),
        ),
        child: Hero(
          tag: image.previewUrl,
          child: Image.network(image.previewUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
