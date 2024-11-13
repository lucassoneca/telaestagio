import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'Pontos/pontos.dart';

class mapa extends StatefulWidget {
  const mapa({super.key});

  @override
  State<mapa> createState() => _MapaState();
}

class _MapaState extends State<mapa> {
  late Future<List<Pontos>> _pontosFuture;
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _pontosFuture = Pontos.procurarPontos();
  }

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
        /*MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            maxClusterRadius: 250,
            markers: pontos.map((pontos) {
              final iconKey = GlobalKey();
              return Marker(
                key: iconKey,
                point: pontos.point,
                width: 40,
                height: 40, builder: (BuildContext context) => build(context),
              );
            }).toList(),
            builder: (context, cluster) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    '${cluster.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              );
            },
          ),
        )*/
        ],
      ),
    );
  }
}