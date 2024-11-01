import 'package:flutter/material.dart';
import '../Mapa/mapa.dart';
import '../login/tela1.dart';

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
    return Container(
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset('images/onibus.png'),
        ),
        actions: [
          Container(
            child: DropdownButtonHideUnderline(
              child: ValueListenableBuilder(
                valueListenable: dropValue,
                builder: (BuildContext context, String value, _) {
                  return DropdownButton<String>(
                    dropdownColor: Colors.blue,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    alignment: Alignment.center,
                    icon: RotatedBox(
                      quarterTurns: 4,
                      child: Icon(Icons.arrow_drop_down, size: 35, color: Colors.white),
                    ),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) => dropValue.value = escolha.toString(),
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
          ),

          SizedBox(width: 10),

          Container(
            child: Text('Manutenção',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),

          SizedBox(width: 20),

          Container(
            child: Text('Vistoria',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
          ),

          SizedBox(width: 20),

          Container(
            child: Text('Materiais',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
          ),

          SizedBox(width: 20),
          Container(
            child: TextButton(
              onPressed: () {// Volta para a tela de login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: Text(
                'Deslogar',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
          color: Colors.red,
          height: 500,
          width: 600,
          margin: EdgeInsets.all(100),
          child: Column(
            children: [
              Text(
                'Bem-vindo ao Sistema de Pontos de Paradas',
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.lightBlue[900],
                  fontWeight: FontWeight.bold
                ),
              ),
              const Text(
                'Cadastre novas paradas, ative e desative, cadastre vistorias e manutenções de qualquer lugar, rápido e fácil.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 20),

              Container(
                child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const mapa()),
                          );  // Lógica para 'Mapa' (botão)
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber[400],
                          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        child: const Text(
                          'Mapa',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ),
                ),
              ],
          ),
            ),
        backgroundColor: Colors.white70,
          ),
      );
  }
}