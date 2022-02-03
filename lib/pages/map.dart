import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlutterMap(
      options: MapOptions(
      center: latLng.LatLng(51.5, -0.09),
      zoom: 13.0,
    ),
    layers: [
      TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c'],
        attributionBuilder: (_) {
          return Text("© OpenStreetMap contributors");
        },
      ),
      MarkerLayerOptions(
        markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: latLng.LatLng(58.8, 6.1),
            builder: (ctx) =>
            Container(
              child: const Icon(CupertinoIcons.map_pin, color: CupertinoColors.white,),
            ),
          ),
        ],
      ),
    ],
  )
    );
  }
}