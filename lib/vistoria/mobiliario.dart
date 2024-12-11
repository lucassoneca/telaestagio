import 'package:flutter/material.dart';

class mobiliario extends StatefulWidget {
  const mobiliario({super.key});

  @override
  State<mobiliario> createState() => _mobiliarioState();
}

class _mobiliarioState extends State<mobiliario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        // Ícone de voltar no topo
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.indigo),
            onPressed: () {
              Navigator.pop(context); // Voltar à tela anterior
            },
          ),
          // Espaço entre o ícone e a box azul
          const SizedBox(height: 50),
          // Centraliza a box azul
          Column(
            children: [
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            ],
          ),
        ]
      ),
    );
  }
}