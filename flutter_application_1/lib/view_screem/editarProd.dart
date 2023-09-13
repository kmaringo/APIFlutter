import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/producto_api.dart';
import 'package:flutter_application_1/view_screem/HomeProd.dart';
import 'package:flutter_application_1/view_screem/menu.dart';

class EditarProducto extends StatefulWidget {
  const EditarProducto({
    Key? key,
    required this.producto,
  });

  final Map<String, dynamic> producto;

  @override
  _EditarProductoState createState() => _EditarProductoState();
}

class _EditarProductoState extends State<EditarProducto> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateFields();
  }

  _updateFields() {
    _nombreController.text = widget.producto['nombre'];
    _descripcionController.text = widget.producto['descripcion'];
    _precioController.text = widget.producto['precio'].toString();
    _estadoController.text = widget.producto['estado'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Editar Producto'),
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
                decoration: InputDecoration(labelText: 'Descripción'),
              ),
              TextFormField(
                controller: _precioController,
                decoration: InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _estadoController,
                decoration: const InputDecoration(labelText: 'Estado'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final Map<String, dynamic> productoEditado = {
                    '_id': widget.producto['_id'],
                    'nombre': _nombreController.text,
                    'descripcion': _descripcionController.text,
                    'precio': _precioController.text,
                    'estado': _estadoController.text,
                  };

                  final api = new Producto();
                  try {
                    await api.editRegistro(productoEditado);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductoP()),
                    );
                  } catch (e) {
                    print('No se modificó el registro de manera exitosa');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                ),
                child: const Text('Editar'),
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
