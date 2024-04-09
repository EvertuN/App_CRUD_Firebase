import 'package:app_crud_firebase/pages/AppRoutes.dart';
import 'package:app_crud_firebase/pages/database/databaseOperations.dart';
import 'package:flutter/material.dart';

class RegisterProductPage extends StatefulWidget {
  const RegisterProductPage({super.key});

  @override
  State<RegisterProductPage> createState() => _RegisterProductPageState();
}

class _RegisterProductPageState extends State<RegisterProductPage> {

  // Criação dos controllers para cada campo de texto
  final TextEditingController _productnameController = TextEditingController();
  final TextEditingController _descproductController = TextEditingController();

  @override
  void dispose() {
    _productnameController.dispose();
    _descproductController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Cadastrar Produto', style: TextStyle(color: Colors.white),),
        elevation: 5,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            TextFormField(
              controller: _productnameController,
              decoration: const InputDecoration(
                labelText: 'Nome do Produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10), // Espaço entre os campos
            TextFormField(
              controller: _descproductController,
              decoration: const InputDecoration(
                labelText: 'Descrição do produto',
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
                DatabaseOperationFirebase().createNewProductFirebase(_productnameController.text, _descproductController.text);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Produto cadastrado com sucesso! ')));
                print('Cadastrando...');
                Navigator.pushReplacementNamed(context, AppRoutes.homePage);
              },
              child: const Text('Cadastrar Produto', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}