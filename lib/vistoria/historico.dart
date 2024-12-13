import 'package:flutter/material.dart';

class historico extends StatefulWidget {
  const historico({super.key});

  @override
  State<historico> createState() => _historicoState();
}

final dropValue = ValueNotifier('Manter paradas');
final dropOpcoes = ['Manter paradas', 'Mapa'];

class _historicoState extends State<historico> {
  List<dynamic> paradas = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Histórico",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Center(
            child: Text(' Detalhes',
              style: TextStyle(
                fontSize: 26,
                color: Colors.blue,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Text('foto da parada'),
            ),
          ),

          const SizedBox(height: 10,),

          Container(
            child: Text('Nome da Parada',
              style: TextStyle(
                fontSize: 26,
                color: Colors.blue,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: Container(
              height: 150,
              width: 500,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Código:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text('Abrigo:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text('Facilidades:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10), // Espaçamento entre as linhas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Tipo:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text('Local:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text('Livraria:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          SizedBox(height: 20),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('Manutenções',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.blue,
                    ),
                  ),
                ),

                SizedBox(width: MediaQuery.of(context).size.width * 0.35),

                Container(
                  child: Text('Vistorias',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza os itens na Row
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
                    mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0), // Espaçamento interno
                        child: Text(
                          'Data:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0), // Espaçamento interno
                        child: Text(
                          'Observações:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0), // Espaçamento interno
                        child: Text(
                          'Responsável pela Manutenção::',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: MediaQuery.of(context).size.width * 0.1),

                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
                    mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0), // Espaçamento interno
                        child: Text(
                          'Data:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Avaliação:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Critérios de Avaliação:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Responsável pela Manutenção:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}