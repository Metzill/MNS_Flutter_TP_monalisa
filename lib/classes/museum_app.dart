import 'package:flutter/material.dart';
import 'package:monalisa/classes/artwork_stateful.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Museum",
      theme: ThemeData(
        primaryColor: Colors.brown,
      ),
      home: const Artwork(),
    );
  }
}
