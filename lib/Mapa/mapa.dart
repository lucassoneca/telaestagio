import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class mapa extends StatefulWidget {
  const mapa({super.key});

  @override
  State<mapa> createState() => _MapaState();
}

class _MapaState extends State<mapa> {
@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
    ),
    body: FlutterMap(
      options: MapOptions(
        center: LatLng(-15.7801, -47.9292),
        zoom: 16,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
          ),
        ],
      ),
    );
  }
}