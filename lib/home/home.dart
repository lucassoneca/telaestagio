import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  // Variáveis para armazenar o valor selecionado de cada Dropdown
  String? dropdownValue1 = 'Manter Paradas';
  String? dropdownValue2 = 'Opção 1';
  String? dropdownValue3 = 'Opção 1';
  String? dropdownValue4 = 'Opção 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false, // Remove a seta de voltar

        // Adicionando Dropdowns ao lado direito da AppBar
        actions: <Widget>[
          // Primeiro Dropdown
          DropdownButton<String>(
            value: dropdownValue1,
            dropdownColor: Colors.blue,
            style: const TextStyle(color: Colors.white),
            underline: Container(),
            // Remove a linha do dropdown
            iconEnabledColor: Colors.white,
            // Cor do ícone do dropdown
            items: <String>['Manter Paradas', 'Opção 2', 'Opção 3', 'Opção 4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue1 = newValue;
              });
            },
          ),

          // Segundo Dropdown
          DropdownButton<String>(
            value: dropdownValue2,
            dropdownColor: Colors.blue,
            style: const TextStyle(color: Colors.white),
            underline: Container(),
            iconEnabledColor: Colors.white,
            items: <String>['Opção 1', 'Opção 2', 'Opção 3', 'Opção 4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue2 = newValue;
              });
            },
          ),

          // Terceiro Dropdown
          DropdownButton<String>(
            value: dropdownValue3,
            dropdownColor: Colors.blue,
            style: const TextStyle(color: Colors.white),
            underline: Container(),
            iconEnabledColor: Colors.white,
            items: <String>['Opção 1', 'Opção 2', 'Opção 3', 'Opção 4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue3 = newValue;
              });
            },
          ),

          // Quarto Dropdown
          DropdownButton<String>(
            value: dropdownValue4,
            dropdownColor: Colors.blue,
            style: const TextStyle(color: Colors.white),
            underline: Container(),
            iconEnabledColor: Colors.white,
            items: <String>['Opção 1', 'Opção 2', 'Opção 3', 'Opção 4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue4 = newValue;
              });
            },
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/onibus.png'),
        ),
      ),
    );
  }
  }