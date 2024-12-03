import 'package:flutter/material.dart';

class vistoria extends StatefulWidget {
  const vistoria({super.key});

  @override
  State<vistoria> createState() => _vistoriaState();
}

class _vistoriaState extends State<vistoria> {
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
          const SizedBox(height: 20),
          // Centraliza a box azul
          Center(
            child: Text('Cadastrar Vistorias de Paradas',
              style: TextStyle(
                color: Colors.blue[800],
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 500,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text('Código Parada',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 450, // Largura máxima
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true, // preenchimento do fundo
                          fillColor: Colors.white, // Define o fundo branco
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                            borderSide: BorderSide.none, // Remove a borda padrão
                          ),
                        ),
                        style: TextStyle(fontSize: 16), // Estilo do texto digitado
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text('Data',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 450, // Largura máxima
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true, // preenchimento do fundo
                          fillColor: Colors.white, // Define o fundo branco
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                            borderSide: BorderSide.none, // Remove a borda padrão
                          ),
                        ),
                        style: TextStyle(fontSize: 16), // Estilo do texto digitado
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text('Código Usuário',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 450, // Largura máxima
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true, // preenchimento do fundo
                          fillColor: Colors.white, // Define o fundo branco
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                            borderSide: BorderSide.none, // Remove a borda padrão
                          ),
                        ),
                        style: TextStyle(fontSize: 16), // Estilo do texto digitado
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text('Cidade',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 450, // Largura máxima
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true, // preenchimento do fundo
                          fillColor: Colors.white, // Define o fundo branco
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                            borderSide: BorderSide.none, // Remove a borda padrão
                          ),
                        ),
                        style: TextStyle(fontSize: 16), // Estilo do texto digitado
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text('Descrição Vistoria',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 450, // Largura máxima
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true, // preenchimento do fundo
                          fillColor: Colors.white, // Define o fundo branco
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                            borderSide: BorderSide.none, // Remove a borda padrão
                          ),
                        ),
                        style: TextStyle(fontSize: 16), // Estilo do texto digitado
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        print('teste botao');
                      },
                      style: ElevatedButton.styleFrom( //estilização do botão
                        backgroundColor: Colors.amber[300],
                        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Salvar",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}