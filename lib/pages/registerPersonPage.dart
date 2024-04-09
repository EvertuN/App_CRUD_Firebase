import 'package:app_crud_firebase/pages/AppRoutes.dart';
import 'package:app_crud_firebase/pages/database/databaseOperations.dart';
import 'package:flutter/material.dart';

class RegisterPersonPage extends StatefulWidget {
  const RegisterPersonPage({super.key});

  @override
  State<RegisterPersonPage> createState() => _RegisterPersonPageState();
}

class _RegisterPersonPageState extends State<RegisterPersonPage> {

  // Criação dos controllers para cada campo de texto
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  @override
  void dispose() {
    // É importante limpar os controllers quando o widget for desmontado
    _nomeController.dispose();
    _emailController.dispose();
    _cpfController.dispose();
    _dataNascimentoController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Cadastrar Nova Pessoa', style: TextStyle(color: Colors.white),),
        elevation: 5,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Permite a rolagem da tela
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            // Campo para o Nome Completo
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome Completo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10), // Espaço entre os campos
            // Campo para o Email
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Campo para o CPF
            TextFormField(
              controller: _cpfController,
              decoration: const InputDecoration(
                labelText: 'CPF',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Campo para a Data de Nascimento
            TextFormField(
              controller: _dataNascimentoController,
              decoration: const InputDecoration(
                labelText: 'Data de Nascimento',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Campo para o Telefone
            TextFormField(
              controller: _telefoneController,
              decoration: const InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 60),
                backgroundColor: Colors.blueAccent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                DatabaseOperationFirebase().createNewUserFirebase(_nomeController.text, _emailController.text, _cpfController.text, _dataNascimentoController.text, _telefoneController.text);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cadastro feito com sucesso! ')));
                print('Cadastrando...');
                Navigator.pushReplacementNamed(context, AppRoutes.homePage);
              },
              child: const Text('Cadastrar', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}