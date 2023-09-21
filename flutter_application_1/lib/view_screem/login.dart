// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/login_model.dart';
import 'package:flutter_application_1/view_screem/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();
  bool _isLoading = true;
  List<Cliente> clientes = [];
  var usuario = 'mateo';
  var contrasena = 123;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    try {
      String url = "https://apisflutter.onrender.com/api/cliente";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        List<dynamic> jsonData = json.decode(res.body)["msg"];
        clientes = jsonData.map((item) => Cliente.fromJson(item)).toList();
        setState(() {
          _isLoading = false;
        });
      } else {
        throw Exception("No hay datos para cargar");
      }
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Text('Bienvenido'),
        ),
      ),
      body: Container(
        margin:
                const EdgeInsets.symmetric(vertical: 180.0),
        child: Center(
          child: Column(children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
              height: 50,
              child: TextField(
                controller: correoController,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Correo Electronico'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 60.0,
              ),
              height: 50,
              child: TextField(
                controller: contrasenaController,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Contraseña'),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.login,
                color: Colors.deepPurple,
              ),
              onPressed: () {
                int positionCliente = -1;
      
                for (int i = 0; i < clientes.length; i++) {
                  if (clientes[i].correo == correoController.text &&
                      clientes[i].contrasena == contrasenaController.text) {
                    positionCliente = i;
                    break;
                  }
                }
      
                if (positionCliente != -1) {
                  final route = MaterialPageRoute(
                      builder: (context) => MyHomePage());
                  Navigator.push(context, route);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.deepPurple,
                      content: Text('Correo o contraseña incorrectos')));
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}
