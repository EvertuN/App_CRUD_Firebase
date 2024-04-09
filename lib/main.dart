import 'package:app_crud_firebase/firebase_options.dart';
import 'package:app_crud_firebase/homePage.dart';
import 'package:app_crud_firebase/main.dart';
import 'package:app_crud_firebase/pages/AppRoutes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.homePage,
    routes: AppRoutes.define(),
  ));
}