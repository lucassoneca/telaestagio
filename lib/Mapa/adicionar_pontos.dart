import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:telaestagio/vistoria/mobiliario.dart';

class adicionar extends StatefulWidget {
  const adicionar({super.key});

  @override
  State<adicionar> createState() => _adicionarState();
}

class _adicionarState extends State<adicionar> {
  bool isChecked = false; //estado inicial do checkbox
  String? _filePath; // Armazena o caminho do arquivo selecionado
  bool _isUploading = false; // Indica se o upload está em progresso
  final TextEditingController _controller = TextEditingController();
  final List<String> _options = ['Opção 1', 'Opção 2', 'Opção 3', 'Opção 4'];
  String? _selectedOption;

  // Função para selecionar o arquivo
  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    }
  }

  // Função para enviar o arquivo
  Future<void> _uploadFile() async {
    if (_filePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nenhum arquivo selecionado!')),
      );
      return;
    }

    setState(() {
      _isUploading = true;
    });

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://example.com/upload'), // URL do seu endpoint
      );
      request.files.add(await http.MultipartFile.fromPath('file', _filePath!));

      var response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Arquivo enviado com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha no upload. Código: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

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
            child: Text('Adicionar Ponto de Parada',
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
                height: 800,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text('Latitude',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
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
                        style: const TextStyle(fontSize: 16), // Estilo do texto digitado
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Text('Longitude',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
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
                        style: const TextStyle(fontSize: 16), // Estilo do texto digitado
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Text('Endereço',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
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
                        style: const TextStyle(fontSize: 16), // Estilo do texto digitado
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text('Ponto de Parada Ativo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Checkbox(
                      checkColor: Colors.blue,
                      value: isChecked,
                      activeColor: Colors.white,
                      onChanged: (newBool) {
                        setState(() {
                          isChecked = newBool ?? false;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    const Text('Imagem da parada',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: _selectFile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Upload de Arquivo'),
                    ),
                    if (_filePath != null) ...[
                      const SizedBox(height: 20),
                      Text('Arquivo Selecionado:\n$_filePath'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: _isUploading ? null : _uploadFile,
                          child: _isUploading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Enviar Arquivo'),
                      ),
                    ],

                    const SizedBox(height: 20),

                    const Text(
                      'Tipo Mobiliário',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 450, // Largura máxima
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          filled: true, // preenchimento do fundo
                          fillColor: Colors.white, // Define o fundo branco
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                            borderSide: BorderSide.none, // Remove a borda padrão
                          ),
                        ),
                        style: const TextStyle(fontSize: 16, color: Colors.black), // Estilo do texto selecionado
                        value: 'Tipo C', // Valor inicial
                        items: const [
                          DropdownMenuItem(
                            value: 'Tipo C',
                            child: Text('Tipo C'),
                          ),
                          DropdownMenuItem(
                            value: 'Cemusa',
                            child: Text('Cemusa'),
                          ),
                          DropdownMenuItem(
                            value: 'Padrão 2',
                            child: Text('Padrão 2'),
                          ),
                        ],
                        onChanged: (value) {
                          // Lógica ao alterar a opção
                          print('Selecionado: $value');
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text('Sentido',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
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
                        style: const TextStyle(fontSize: 16), // Estilo do texto digitado
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const mobiliario()));
                      },
                      style: ElevatedButton.styleFrom( //estilização do botão
                        backgroundColor: Colors.amber[300],
                        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "PRÓXIMO",
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