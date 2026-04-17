import 'package:flutter/material.dart';

import '../models/mural.dart';

class MuralScreen extends StatelessWidget {
  const MuralScreen({super.key, required this.mural});

  final Mural mural;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails de la fresque')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(mural.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(mural.artist),
            Text(mural.address),
            Text(mural.year),
            Text(mural.publisher),
          ],
        ),
      ),
    );
  }
}