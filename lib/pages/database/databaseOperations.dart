import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseOperationFirebase {
  final db = FirebaseFirestore.instance;

  Future<void> createNewUserFirebase(String nome, String email, String CPF,
      String dataNascimento, String telefone) async {
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "nome": "$nome",
      "email": "$email",
      "CPF": "$CPF",
      "dataNascimento": "$dataNascimento",
      "telefone": "$telefone",
    };

// Add a new document with a generated ID
    await db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<void> createNewProductFirebase(String productName, String productDesc) async {
    // Create a new user with a first and last name
    final product = <String, dynamic>{
      "productName": "$productName",
      "productDesc": "$productDesc",
    };

// Add a new document with a generated ID
    await db.collection("products").add(product).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<void> createNewSupplierFirebase(String supplierName, String supplierEmail, String supplierCNPJ,
      String supplierDate, String supplierTelefone) async {
    // Create a new user with a first and last name
    final supplier = <String, dynamic>{
      "supplierName": "$supplierName",
      "supplierEmail": "$supplierEmail",
      "supplierCNPJ": "$supplierCNPJ",
      "supplierDate": "$supplierDate",
      "supplierTelefone": "$supplierTelefone",
    };

// Add a new document with a generated ID
    await db.collection("suppliers").add(supplier).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<List> listPersonFirebase() async {
    List<Object> nomes = [];

    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        // print("${doc.id} => ${doc.data()}");
        var data = doc.data();
        var nome = data["nome"];
        nomes.add(nome.toString());
      }
    });
    return nomes;
  }

  Future<List> listProductFirebase() async {
    List<Object> productName = [];

    await db.collection("products").get().then((event) {
      for (var doc in event.docs) {
        // print("${doc.id} => ${doc.data()}");
        var data = doc.data();
        var nome = data["productName"];
        productName.add(nome.toString());
      }
    });
    return productName;
  }

  Future<List> listSupplierFirebase() async {
    List<Object> supplierName = [];

    await db.collection("suppliers").get().then((event) {
      for (var doc in event.docs) {
        // print("${doc.id} => ${doc.data()}");
        var data = doc.data();
        var nome = data["supplierName"];
        supplierName.add(nome.toString());
      }
    });
    return supplierName;
  }

  // Future<List<String>> listPersonSupabase() async {
  //   List<String> nomes = [];
  //
  //   final data = await supabase.from('cadastrarPessoas').select('nome');
  //
  //   for (var pessoa in data) {
  //     nomes.add(pessoa['nome']);
  //   }
  //   return nomes;
  // }


  // Future<void> excluirUsuario(String nome) async {
  //   final response = await supabase.from('cadastrarPessoas').delete().eq('nome', nome);
  //   if (response.error != null) {
  //     throw Exception('Erro ao excluir usuário: ${response.error!.message}');
  //   }
  // }
}
