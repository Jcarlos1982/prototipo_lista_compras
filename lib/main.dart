import 'package:flutter/material.dart';
import 'package:lista_compras/ui/pages/home.dart';
import 'package:lista_compras/ui/pages/lista.dart';
import 'package:lista_compras/ui/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Lista Plus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Splash(),
    );
  }
}
