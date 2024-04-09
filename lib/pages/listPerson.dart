import 'package:flutter/material.dart';
import '../homePage.dart';
import 'database/databaseOperations.dart';

class ListPerson extends StatefulWidget {
  const ListPerson({Key? key}) : super(key: key);

  @override
  State<ListPerson> createState() => _ListPersonState();
}

class _ListPersonState extends State<ListPerson> {
  List<String> pessoas = [];

  @override
  void initState() {
    super.initState();
    buscarNomes();
  }


  Future<void> buscarNomes() async {
    List<String>? listarPessoas = [];
    listarPessoas = (await DatabaseOperationFirebase().listPersonFirebase()).cast<String>();
    setState(() {
      pessoas = listarPessoas!;
    });
  }

  // Future<void> excluirUsuario(String nome) async {
  //   await DatabaseOperation().excluirUsuario(nome);
  //   setState(() {
  //     pessoas.remove(nome);
  //   });
  // }

  // Future<void> _editarNomeDialog(String nome, int index) async {
  //   TextEditingController controller = TextEditingController(text: nome);
  //
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('Editar Nome'),
  //         content: TextField(
  //           controller: controller,
  //           decoration: const InputDecoration(labelText: 'Novo Nome'),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: const Text('Cancelar'),
  //           ),
  //           TextButton(
  //             onPressed: () async {
  //               // Atualiza o nome na lista
  //               setState(() {
  //                 pessoas[index] = controller.text;
  //               });
  //               // Aqui você deve chamar o método para atualizar o nome no banco de dados
  //               // OperationsSupaBaseDB().atualizarNome(pessoas[index], controller.text);
  //               Navigator.pop(context);
  //             },
  //             child: const Text('Salvar'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(73, 144, 252, 1),
        centerTitle: true,
        title: const Text(
          'Listar Pessoas',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
      ),
      body: pessoas.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: pessoas.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    tileColor: const Color.fromRGBO(73, 144, 252, 1),
                    leading: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.cyanAccent,
                      ),
                      onPressed: () {
                        // _editarNomeDialog(pessoas[index], index);
                      },
                    ),
                      title: Text(
                      pessoas[index],
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        // excluirUsuario(pessoas[index]);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
