import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'mural_list.dart';
import 'mural_map.dart';
import '../models/mural.dart';
enum MainView { list, map }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainView _currentView = MainView.map;

  void changeView(bool switchToMap) =>
      setState(() => _currentView = switchToMap ? MainView.map : MainView.list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fresques murales BD de Bruxelles'),
        actions: [
          Row(
            children: [
              const Icon(Icons.view_list_outlined), // Icon for list view
              Switch(
                value: _currentView == MainView.map,
                onChanged: changeView,
              ),
              const Icon(Icons.map_outlined), // Icon for map view
              const SizedBox(width: 8), // Spacing on the right of the switch
            ],
          ),
        ],
      ),      body: FutureBuilder<List<Mural>>(
        future: fetchMurals(),
        builder: (context, snapshot) {
          final murals = snapshot.data!;
          return IndexedStack(
            index: _currentView == MainView.map ? 1 : 0,
            children: [
              MuralList(murals: murals),
              MuralMap(murals: murals),
            ],
          );



          return ListView.separated(
            itemCount: murals.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final mural = murals[index];
              return ListTile(
                onTap: () => context.go('/mural', extra: mural),
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