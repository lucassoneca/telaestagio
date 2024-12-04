import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:telaestagio/Mapa/adicionar_pontos.dart';

class PontosParadaPage extends StatefulWidget {
  @override
  _PontosParadaPageState createState() => _PontosParadaPageState();
}

class _PontosParadaPageState extends State<PontosParadaPage> {
  List<Map<String, dynamic>> pontosParada = [];
  List<Map<String, dynamic>> filteredPontosParada = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('https://www.sistemas.dftrans.df.gov.br/parada/geo/paradas/wgs');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is Map<String, dynamic> && data.containsKey('features')) {
          setState(() {
            pontosParada = (data['features'] as List).map((item) {
              final properties = item['properties'] ?? {};
              return {
                "codDftrans": properties["codDftrans"] ?? "N/A",
                "sentido": properties["sentido"] ?? "N/A",
              };
            }).toList();
            filteredPontosParada = pontosParada; // Inicialmente mostra todos os dados
            isLoading = false;
          });
        } else {
          throw Exception('Formato inesperado do JSON');
        }
      } else {
        throw Exception('Erro ao carregar dados: ${response.statusCode}');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print("Erro: $error");
    }
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredPontosParada = pontosParada
            .where((ponto) =>
            ponto['codDftrans'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredPontosParada = pontosParada; // Se não houver pesquisa, exibe todos os dados
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pontos de Parada",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : pontosParada.isEmpty
            ? Text("Nenhum dado disponível.")
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botão "Adicionar" acima do título
              ElevatedButton(
                onPressed: () {
                  // Lógica para adicionar um novo ponto de parada
                  Navigator.push(context, MaterialPageRoute(builder: (context) => adicionar()));
                },
                child: Text("Adicionar",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 20),
                  backgroundColor: Colors.blue, // Cor de fundo
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Tabela de Pontos de Parada',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              // Barra de pesquisa com tamanho limitado
              Container(
                width: 600,  // Limite de largura para o TextField
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Pesquisar Código Dftrans',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: filterSearchResults,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: 600,  // Tamanho da caixa
                height: 400,  // Limite de altura para a tabela
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,  // Habilitar rolagem vertical
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Código Dftrans')),
                        DataColumn(label: Text('Sentido')),
                      ],
                      rows: filteredPontosParada.map((ponto) {
                        return DataRow(cells: [
                          DataCell(Text(ponto["codDftrans"])),
                          DataCell(Text(ponto["sentido"])),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}