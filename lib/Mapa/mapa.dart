import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import '../Manutencao/manutencao.dart';
import '../home/home.dart';
import '../materiais/materiais.dart';
import '../vistoria/vistoria.dart';
import 'Pontos/pontos.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late Future<List<Pontos>> _pontosFuture;
  final PopupController _popupController = PopupController();
  final dropValue = ValueNotifier('Manter paradas');
  final dropOpcoes = ['Manter paradas', 'Mapa'];

  @override
  void initState() {
    super.initState();
    _pontosFuture = Pontos.procurarPontos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset('images/onibus.png'), // Ícone do app
        ),
        actions: [
          DropdownButtonHideUnderline(
            child: ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return DropdownButton<String>(
                  dropdownColor: Colors.blue,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  alignment: Alignment.center,
                  icon: const Icon(Icons.arrow_drop_down, size: 35, color: Colors.white),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (escolha) {
                    dropValue.value = escolha.toString();
                    if (escolha == 'Mapa') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Mapa()));
                    } else if (escolha == 'Manter paradas') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                    }
                  },
                  items: dropOpcoes.map((opcao) {
                    return DropdownMenuItem(
                      value: opcao,
                      child: Text(opcao),
                    );
                  }
                ).toList(),
              );
            },
          ),
        ),
        const SizedBox(width: 10),
        _buildAppBarText('Manutenção', context),
        const SizedBox(width: 20),
        _buildAppBarText('Vistoria', context),
        const SizedBox(width: 20),
        _buildAppBarText('Materiais', context),
        const SizedBox(width: 20),
        TextButton(
          onPressed: () { //botão 'deslogar' para voltar para a página de login
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
          },
          child: const Text(
            'Voltar',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    body:
      FutureBuilder<List<Pontos>>(
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

              final pontos = snapshot.data!;

              return
                Center(
                  child: Container(
                    child: PopupScope(
                      popupController: _popupController, // Adiciona PopupScope ao contexto
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(-15.7801, -47.9292),
                          initialZoom: 16,
                          onTap: (_, __) => _popupController.hideAllPopups(),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                            tileProvider: CancellableNetworkTileProvider(),
                          ),
                          MarkerClusterLayerWidget(
                            options: MarkerClusterLayerOptions(
                              maxClusterRadius: 250,
                              markers: pontos.map((ponto) {
                                return Marker(
                                  point: ponto.point,
                                  width: 40,
                                  height: 40,
                                  child: const Icon(
                                    Icons.pin_drop,
                                    color: Colors.blue,
                                  ),
                                );
                              }
                            ).toList(),
                            builder: (context, cluster) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    '${cluster.length}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              );
                            },
                            popupOptions: PopupOptions(
                              popupController: _popupController,
                              popupBuilder: (context, marker) {
                                final ponto = pontos.firstWhere(
                                  (p) => p.point == marker.point,
                                );
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min, // Ajusta a altura ao conteúdo
                                      children: [
                                        Text(
                                          'Código: ${ponto.codDftrans}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text('Sentido: (${ponto.sentido})'),
                                        const SizedBox(height: 4),
                                        Wrap(
                                          spacing: 20.0, // Espaço horizontal entre os widgets
                                          runSpacing: 7.0, // Espaço vertical entre as linhas
                                          children: [
                                            InkWell(
                                              child: Text(
                                                'Editar',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration.underline,
                                                ),
                                              ),
                                              onTap: () {
                                                print('edit teste');
                                              },
                                            ),
                                            InkWell(
                                              child: Text(
                                                'Desativar',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration.underline,
                                                ),
                                              ),
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text('Deseja deletar este ponto de parada?'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: const Text('Deletar'),
                                                        ),
                                                        const SizedBox(width: 20),
                                                        TextButton(
                                                          onPressed:() {
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: const Text('Cancelar'),
                                                        ),
                                                      ],
                                                    );
                                                  }
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              ElevatedButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                              },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70),
                              ),
                              padding: EdgeInsets.all(15),
                              backgroundColor: Colors.white,
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                size: 50,
                                color: Colors.blue,
                              ),
                            ),
                              Spacer(),
                              Container(
                                child: ElevatedButton(onPressed: (){
                                  print('teste');
                                },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ), child: const Text('Ocultar paradas inativas',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

  // Função auxiliar para adicionar textos de AppBar
  Widget _buildAppBarText(String text, BuildContext context) {
    //deixa os textos 'clicáveis' (linkados)
    return InkWell(
      onTap: () {
        if (text == 'Manutenção') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const manutencao()));
          //link para a página de manutenção
        } else if (text == 'Vistoria') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const vistoria()));
          //link para a página de vistoria
        } else if (text == 'Materiais') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const materiais()));
          //link para a página de materiais
        }
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}