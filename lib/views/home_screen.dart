import 'package:flutter/material.dart';

import '../models/mural.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fresques murales BD de Bruxelles')),
      body: FutureBuilder<List<Mural>>(
        future: fetchMurals(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final murals = snapshot.data!;
          return ListView.separated(
            itemCount: murals.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final mural = murals[index];
              return ListTile(
                title: Text(mural.name),
                subtitle: Text('${mural.artist} • ${mural.address}'),
              );
            },
          );
        },
      ),
    );
  }
}