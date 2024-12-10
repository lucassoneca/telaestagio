import 'package:flutter/material.dart';
import '../Manutencao/manutencao.dart';
import '../Mapa/mapa.dart';
import '../home/home.dart';
import '../materiais/materiais.dart';
import 'vistoria.dart';

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
                  items: dropOpcoes.map(
                          (opcao) {
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
            child: const Text('Voltar',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
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