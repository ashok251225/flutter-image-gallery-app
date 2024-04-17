import 'package:flutter/material.dart';
import 'package:gallery_application/image_detail_screen.dart';
import 'package:gallery_application/image_model.dart';

class ImageTile extends StatelessWidget {
  final ImageModel image;

  ImageTile({required this.image, super.key});

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
          tag: image.url,
          child: Image.network(image.url, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
