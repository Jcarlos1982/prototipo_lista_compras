import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    _carregar().then((value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Home(tittle: 'Minha Lista de Compras'))));
  }

  Future _carregar() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.height / 2,
            child: Column(children: const [
              Text(
                'Minha Lista Plus',
                style: TextStyle(fontSize: 25, color: Colors.green),
              ),
              Icon(
                Icons.list,
                color: Colors.green,
                size: 100,
              ),
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Zec@ 2022',
                style: TextStyle(fontSize: 15, color: Colors.green),
              ),
            ])),
      ),
    );
  }
}
