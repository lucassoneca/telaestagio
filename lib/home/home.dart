import 'package:flutter/material.dart';
import '../Manutencao/manutencao.dart';
import '../materiais/materiais.dart';
import '../vistoria/vistoria.dart';
import '../Mapa/mapa.dart';
import '../login/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dropValue = ValueNotifier('Manter paradas');
  final dropOpcoes = ['Manter paradas', 'Mapa'];

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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const mapa()));
                    } else if (escolha == 'Manter paradas') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                    }
                  },
                  items: dropOpcoes.map((opcao) {
                    return DropdownMenuItem(
                      value: opcao,
                      child: Text(opcao),
                    );
                  }).toList(),
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Text(
              'Deslogar',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 500,
              width: 600,
              child: RichText(
                text: TextSpan(
                  text: 'Bem-vindo ao Sistema de Pontos de Paradas\n',
                  style: TextStyle(
                    fontSize: 70,
                    color: Colors.lightBlue[900],
                  ),
                  children: [
                    const TextSpan(
                      text: 'Cadastre novas paradas, ative e desative, cadastre vistorias e manutenções de qualquer lugar, rápido e fácil.\n',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    WidgetSpan(
                      child: ElevatedButton(
                        onPressed: () {
                          //link para deixar o botão na tela 'clicável' e redirecionar para a tela do mapa
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const mapa()));
                        },
                        style: ElevatedButton.styleFrom( //estilização do botão
                          backgroundColor: Colors.amber[300],
                          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        child: const Text(
                          "Mapa",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset('images/paradaponto.png'), // Imagem de ponto de parada
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white70,
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