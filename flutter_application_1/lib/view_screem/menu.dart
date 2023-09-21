import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_screem/Home.dart';
import 'package:flutter_application_1/view_screem/HomePaq.dart';
import 'package:flutter_application_1/view_screem/HomeProd.dart';
import 'package:flutter_application_1/view_screem/camara.dart';
import 'package:flutter_application_1/view_screem/gps.dart';
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
              'https://i.ibb.co/QYyw7JG/Logo-sobre-moda-femenina-minimalista-neutral.png',
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
              color: Colors.white,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      'https://i.ibb.co/QYyw7JG/Logo-sobre-moda-femenina-minimalista-neutral.png',
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
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text("Servicio"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ServicioP()),
                  );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Producto"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductoP()),
                  );
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text("Paquete"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
                  );
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Camara"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CameraApp()),
                  );
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text("GPS"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MapScreen()),
                  );
            },
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 130.0),
            child: const Divider()),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
              
            },
          ),
        ],
      ),
    );
  }
}
