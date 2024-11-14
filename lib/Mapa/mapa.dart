import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'Pontos/pontos.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late Future<List<Pontos>> _pontosFuture;
  final MapController _mapController = MapController();
  final PopupController _popupController = PopupController();

  @override
  void initState() {
    super.initState();
    _pontosFuture = Pontos.procurarPontos();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<Pontos>>(
        future: _pontosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum ponto encontrado.'));
          }

          final pontos = snapshot.data!; // Aqui estamos acessando a lista de pontos

          return Stack(
            children: [
              PopupScope(
                popupController: _popupController,
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(-15.7801, -47.9292),
                      initialZoom: 16,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerClusterLayerWidget(
                        options: MarkerClusterLayerOptions(
                          maxClusterRadius: 250,
                          markers: pontos.map((ponto) {
                            final iconKey = GlobalKey();
                            return Marker(
                              key: iconKey,
                              point: ponto.point,  // Supondo que 'Pontos' tenha um atributo 'point' do tipo LatLng
                              width: 40,
                              height: 40,
                              child: Icon(Icons.pin_drop, color: Colors.blue,),
                            );
                          }).toList(),
                          builder: (context, cluster) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
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
                         /* popupOptions: PopupOptions(
                            popupController: _popupController,
                            popupBuilder: (context, marker) {
                              final condDftrans = markersProvider.encontrarCodDftransPorMarker(marker);

                              if (condDftrans == null) {
                                return const Text('Dados não disponíveis');
                              }
                            }
                          )*/
                        ),
                      ),
                    ],
                  )
              )
            ],
          );
        },
      ),
    );
  }
}