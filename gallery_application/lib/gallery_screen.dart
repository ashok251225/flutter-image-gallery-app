import 'package:flutter/material.dart';
import 'package:gallery_application/image_model.dart';
import 'package:gallery_application/image_tile.dart';
import 'package:gallery_application/pixabay_api.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late Future<List<ImageModel>> images;

  @override
  void initState() {
    super.initState();
    images = PixabayApi().fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: FutureBuilder<List<ImageModel>>(
        future: images,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Calculate the number of columns based on screen width
            var width = MediaQuery.of(context).size.width;
            var crossAxisCount = width > 600 ? 4 : 2;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ImageTile(image: snapshot.data![index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
