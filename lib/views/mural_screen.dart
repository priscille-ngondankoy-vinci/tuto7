import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../models/mural.dart';

class MuralScreen extends StatefulWidget {
  final dynamic mural;

  const MuralScreen({super.key, required this.mural});

State<MuralScreen> createState() => _MuralScreenState();

}
class _MuralScreenState extends State<MuralScreen> {
  late final MapController _miniMapController;

  @override
  void initState() {
    super.initState();
    _miniMapController = MapController.withPosition(
      initPosition: GeoPoint(
        latitude: widget.mural.latitude,
        longitude: widget.mural.longitude,
      ),
    );
  }

  @override
  void dispose() {
    _miniMapController.dispose();
    super.dispose();
  }
  Future<void> _onMiniMapReady(bool isReady) async {
    if (!isReady) return;
    await _miniMapController.addMarker(
      GeoPoint(
        latitude: widget.mural.latitude,
        longitude: widget.mural.longitude,
      ),
      markerIcon: const MarkerIcon(
        iconWidget: SizedBox.square(
          dimension: 48,
          child: Icon(Icons.place, color: Colors.red, size: 48),
        ),
      ),
    );
  }
  late final dynamic mural;
  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width > 800;

    return Scaffold(
      appBar: AppBar(title: const Text('Détails de la fresque')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // au début de la méthode build, avant de retourner le Scaffold

// À la place du Text "no mini-map yet"
          ClipRRect(
          borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: isWide ? 300 : 150,
        height: isWide ? 160 : 120,
        child: OSMFlutter(
          controller: _miniMapController,
          onMapIsReady: _onMiniMapReady,
          osmOption: OSMOption(
            showZoomController: false,
            zoomOption: const ZoomOption(
              initZoom: 16,
              minZoomLevel: 5,
              maxZoomLevel: 19,
            ),
          ),
        ),
      ),
    ),
          ],
        ),
      ),
    );
  }



}



