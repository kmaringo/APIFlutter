import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/producto_api.dart';
import 'package:flutter_application_1/view_screem/HomeProd.dart';
import 'package:flutter_application_1/view_screem/menu.dart';

class CreateProducto extends StatefulWidget {
  @override
  _CreateProductoState createState() => _CreateProductoState();
}

class _CreateProductoState extends State<CreateProducto> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Crear Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
              TextFormField(
                controller: _precioController,
                decoration: const InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _estadoController,
                decoration: const InputDecoration(labelText: 'Estado'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final Map<String, dynamic> crearProducto = {
                    'nombre': _nombreController.text,
                    'descripcion': _descripcionController.text,
                    'precio': _precioController.text,
                    'estado': _estadoController.text,
                  };

                  final api = new Producto();
                  try {
                    await api.newRegistro(crearProducto);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductoP()),
                    );
                  } catch (e) {
                    print('El registro no fue exitoso');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                ),
                child: const Text('Crear'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuLateral()),
          );
                },
                style: TextButton.styleFrom(
                  primary: Colors.deepPurple,
                ),
                child: const Text('Regresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
