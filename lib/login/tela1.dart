import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? isChecked = false;
  bool isHovered = false; // Controla se o mouse está sobre o link

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.tertiarySystemGroupedBackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 550,
                height: 600,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Cor da box
                    borderRadius: BorderRadius.circular(10), // Borda arredondada
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1, // Espalhamento da sombra
                        blurRadius: 7, // Desfoque da sombra
                        offset: const Offset(0, 4), // Deslocamento da sombra
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2), // Usar Padding ao redor da imagem
                          child: Image.asset('images/imagessemob.png'),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 28, // Tamanho da fonte
                            fontWeight: FontWeight.bold, // Negrito
                            color: Colors.black, // Cor do texto
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildTextField('Nome de usuário ou e-mail', false),
                        const SizedBox(height: 25),
                        _buildTextField('Senha', true),
                        const SizedBox(height: 15),
                        _buildRememberMeRow(),
                        const SizedBox(height: 30),
                        _buildLoginButton(),
                      ],
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

  Widget _buildTextField(String label, bool isPassword) {
    return TextFormField(
      autofocus: true,
      obscureText: isPassword, // Senha oculta
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.never, // O nome fica fixo
      ),
    );
  }

  Widget _buildRememberMeRow() {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            activeColor: Colors.blue,
            onChanged: (newBool) {
              setState(() {
                isChecked = newBool; // Não é mais null
              });
            },
          ),
          const SizedBox(width: 2), // Espaço entre o Checkbox e o texto
          const Text(
            'Lembre-se de mim',
            style: TextStyle(fontSize: 16),
          ),
          const Spacer(),
          MouseRegion(
            onEnter: (_) {
              setState(() {
                isHovered = true; // Mouse está sobre o texto
              });
            },
            onExit: (_) {
              setState(() {
                isHovered = false; // Mouse não está mais sobre o texto
              });
            },
            child: InkWell(
              onTap: () {
                print('link clicado: Esqueceu sua senha?');
              },
              child: Text(
                'Esqueceu sua senha?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: isHovered
                      ? TextDecoration.underline // Sublinhado ao passar o mouse
                      : TextDecoration.none, // Sem sublinhado normalmente
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.only(left: 5),
      child: ElevatedButton(
        onPressed: () {
          // Lógica para 'entrar'
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Entrar',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
