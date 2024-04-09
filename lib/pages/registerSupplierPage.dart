import 'package:app_crud_firebase/pages/AppRoutes.dart';
import 'package:app_crud_firebase/pages/database/databaseOperations.dart';
import 'package:flutter/material.dart';

class RegisterSupplierPage extends StatefulWidget {
  const RegisterSupplierPage({super.key});

  @override
  State<RegisterSupplierPage> createState() => _RegisterSupplierPageState();
}

class _RegisterSupplierPageState extends State<RegisterSupplierPage> {

  final TextEditingController _suppliernameController = TextEditingController();
  final TextEditingController _supplieremailController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();
  final TextEditingController _datefornecController = TextEditingController();
  final TextEditingController _suppliertelefoneController = TextEditingController();

  @override
  void dispose() {
    // É importante limpar os controllers quando o widget for desmontado
    _suppliernameController.dispose();
    _supplieremailController.dispose();
    _cnpjController.dispose();
    _datefornecController.dispose();
    _suppliertelefoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Cadastrar Novo Fornecedor', style: TextStyle(color: Colors.white),),
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
              controller: _suppliernameController,
              decoration: const InputDecoration(
                labelText: 'Nome do Fornecedor',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10), // Espaço entre os campos
            // Campo para o Email
            TextFormField(
              controller: _supplieremailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Campo para o CPF
            TextFormField(
              controller: _cnpjController,
              decoration: const InputDecoration(
                labelText: 'CNPJ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Campo para a Data de Nascimento
            TextFormField(
              controller: _datefornecController,
              decoration: const InputDecoration(
                labelText: 'Data Início do Fornecimento',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Campo para o Telefone
            TextFormField(
              controller: _suppliertelefoneController,
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
                DatabaseOperationFirebase().createNewSupplierFirebase(_suppliernameController.text, _supplieremailController.text, _cnpjController.text, _datefornecController.text, _suppliertelefoneController.text);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Fornecedor cadastrado com sucesso! ')));
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