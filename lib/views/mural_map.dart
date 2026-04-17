import 'package:flutter/material.dart';

import '../models/mural.dart';

class MuralMap extends StatelessWidget {
  const MuralMap({super.key, required this.murals});

  final List<Mural> murals;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Carte à venir...'));
  }
}