import 'package:app_crud_firebase/homePage.dart';
import 'package:app_crud_firebase/pages/listPerson.dart';
import 'package:app_crud_firebase/pages/listSupplier.dart';
import 'package:app_crud_firebase/pages/registerPersonPage.dart';
import 'package:app_crud_firebase/pages/registerProductPage.dart';
import 'package:app_crud_firebase/pages/listProduct.dart';
import 'package:app_crud_firebase/pages/registerSupplierPage.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const registerPersonPage = '/registerPersonPage';
  static const listPerson = '/listPerson';
  static const registerProductPage = '/registerProductPage';
  static const listProduct = '/listProduct';
  static const registerSupplierPage = '/registerSupplierPage';
  static const listSupplier = '/listSupplier';

  static Map<String, WidgetBuilder> define(){
    return{
      homePage: (BuildContext context) => const HomePage(),
      registerPersonPage: (BuildContext context) => const RegisterPersonPage(),
      listPerson: (BuildContext context) => const ListPerson(),
      registerProductPage: (BuildContext context) => const RegisterProductPage(),
      listProduct: (BuildContext context) => const ListProduct(),
      registerSupplierPage: (BuildContext context) => const RegisterSupplierPage(),
      listSupplier: (BuildContext context) => const ListSupplier(),
    };
  }
}