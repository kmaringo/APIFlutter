import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_screem/menu.dart';

class Registrar extends StatefulWidget {
  const Registrar({Key? key}) : super(key: key);

  @override
  State<Registrar> createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  final usuarioController = TextEditingController();
  final passwordController = TextEditingController();

  void _loginButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Bienvenido"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 26.0),
            child: TextField(
              controller: usuarioController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.people),
                labelText: 'Usuario',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 26.0),
            child: TextField(
              controller: passwordController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.screen_lock_landscape_outlined),
                labelText: 'Contraseña',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  
                },
                child: const Text('¿Olvidó su contraseña?'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ElevatedButton(
              onPressed: _loginButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}


