import 'package:flutter/material.dart';
import 'package:gallery_application/gallery_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GalleryScreen(),
    );
  }
}
