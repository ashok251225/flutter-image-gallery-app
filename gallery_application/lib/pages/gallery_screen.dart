import 'package:flutter/material.dart';
import 'package:gallery_application/components/custom_loading_indicator.dart';

import 'package:gallery_application/models/image_response_model.dart';
import 'package:gallery_application/components/image_tile.dart';
import 'package:gallery_application/api/pixabay_api.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});
  @override
  GalleryScreenState createState() => GalleryScreenState();
}

class GalleryScreenState extends State<GalleryScreen> {
  late Future<List<Hit>> images;

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
      body: FutureBuilder<List<Hit>>(
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
          return const FlowerLoadingIndicator();
        },
      ),
    );
  }
}
