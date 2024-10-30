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
        child: DropdownButtonHideUnderline (
          child: ValueListenableBuilder(
            valueListenable: dropValue, builder: (BuildContext context, String value, _) {
              return DropdownButton<String>(
                dropdownColor: Colors.blue,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                alignment: Alignment.center,
                icon: RotatedBox(
                  quarterTurns: 4,
                  child: Icon(Icons.arrow_drop_down, size: 35,),
                ),
                value: (value.isEmpty) ? null: value,
                onChanged: (escolha) => dropValue.value = escolha.toString(),
                items: dropOpcoes.map((opcao) => DropdownMenuItem(
                    child: Text(opcao ),
                    value: opcao,
                  ),).toList()
                );
              },
            )
          ),
        ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            child: Text(
              'Manutenção',
              style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            child: Text(
              'Vistoria',
              style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            child: Text(
              'Materiais',
              style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextButton(
            onPressed: () { // Volta para a tela de login
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
      body: Center(child: Text('Conteúdo principal')),
      backgroundColor: Colors.white70,
    );
  }
}