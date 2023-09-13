import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_screem/Home.dart';
import 'package:flutter_application_1/view_screem/HomePaq.dart';
import 'package:flutter_application_1/view_screem/HomeProd.dart';
import 'package:flutter_application_1/view_screem/login.dart';



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Decoraciones Lina Tabares'),
      ),
      drawer: MenuLateral(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              '../img/LogoLT.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Transformando Espacios en Sueños...',
              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      '../img/LogoLT.png',
                      width: 200,
                      height: 200,
                    ),
                  ),

                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Menú",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("Servicio"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServicioP()),
                  );
            },
          ),
          ListTile(
            title: const Text("Producto"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductoP()),
                  );
              
            },
          ),
          ListTile(
            title: const Text("Paquete"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
                  );
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 180.0),
            child: Divider()),
          ListTile(
            title: Text("Log Out"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registrar()),
                  );
              // Aquí puedes agregar la lógica para cerrar la sesión
            },
          ),
        ],
      ),
    );
  }
}
