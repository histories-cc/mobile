import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  final MapController mapController;

  const MapPage({Key? key, required this.mapController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlutterMap(
        children: [
          TileLayerWidget(
            options: TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
          ),
          LocationMarkerLayerWidget(),
        ],
        options: MapOptions(
          center: LatLng(51.5, -0.09),
          zoom: 13.0,
          maxZoom: 18.0,
          minZoom: 5.0,
          interactiveFlags: InteractiveFlag.doubleTapZoom |
              InteractiveFlag.drag |
              InteractiveFlag.pinchMove |
              InteractiveFlag.pinchZoom,
        ),
        layers: [
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(58.8, 6.1),
                builder: (ctx) => const Icon(
                  CupertinoIcons.map_pin,
                  color: CupertinoColors.white,
                ),
              ),
            ],
          ),
        ],
        mapController: mapController,
      ),
    );
  }
}
