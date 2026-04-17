import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../models/mural.dart';

class MuralMap extends StatefulWidget {
  const MuralMap({super.key, required this.murals});
  final List<Mural> murals;

  State<MuralMap> createState() => _MuralMapState();
}

  class _MuralMapState extends State<MuralMap> {
    final _mapController = MapController.withPosition(
      initPosition: GeoPoint(latitude: 50.8466, longitude: 4.3528),
    );

    @override
    void dispose() {
      _mapController.dispose();
      super.dispose();
    }


    @override
    Widget build(BuildContext context) {
      return OSMFlutter(
        controller: _mapController,
        osmOption: OSMOption(
          zoomOption: const ZoomOption(
            initZoom: 13,
            minZoomLevel: 5,
            maxZoomLevel: 19,
          ),
        ),
        mapIsLoading: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }


  }


  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Carte à venir...'));
  }





