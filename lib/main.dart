import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'models/mural.dart';
import 'views/home_screen.dart';
import 'views/mural_screen.dart';

void main() => runApp(const MuralMapApp());

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'mural',
          builder: (context, state) {
            final mural = state.extra;
            if (mural is! Mural) {
              return Scaffold(
                appBar: AppBar(title: const Text('Détail de la fresque')),
                body: const Center(child: Text('Aucune fresque sélectionnée.')),
              );
            }
            return MuralScreen(mural: mural);
          },
        ),
      ],
    ),
  ],
);

class MuralMapApp extends StatelessWidget {
  const MuralMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Fresques murales BD de Bruxelles',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      routerConfig: _router,
    );
  }
}