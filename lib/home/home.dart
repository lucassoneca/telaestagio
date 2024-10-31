import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset('images/onibus.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
          _buildAppBarButton('Manutenção'),
          _buildAppBarButton('Vistoria'),
          _buildAppBarButton('Materiais'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              onPressed: () {
                // Volta para a tela de login
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
        child: Container(
          height: 500,
          width: 600,
          margin: EdgeInsets.all(150),
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
              Text(
                'Cadastre novas paradas, ative e desative, cadastre vistorias e manutenções de qualquer lugar, rápido e fácil',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,

                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.all(0),
                child: ElevatedButton(
                  onPressed: () {
                    print("Botão pressionado" );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[400],
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  child: Text(
                    'Mapa',
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
      backgroundColor: Colors.white70,
    );
  }

  Padding _buildAppBarButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
