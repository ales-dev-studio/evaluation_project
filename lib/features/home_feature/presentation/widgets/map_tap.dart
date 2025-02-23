import 'package:flutter/material.dart';

class MapTap extends StatelessWidget {
  const MapTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: const Center(
        child: Text('Map Tab'),
      ),
    );
  }
}
