import 'package:flutter/material.dart';

class GhostBlocker extends StatelessWidget {
  String imagePath;
  GhostBlocker(this.imagePath, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Image.asset(imagePath),
    );
  }
}
