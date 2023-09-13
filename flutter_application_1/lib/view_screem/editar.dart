import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/servicio_api.dart';
import 'package:flutter_application_1/view_screem/Home.dart';
import 'package:flutter_application_1/view_screem/menu.dart';

class EditarService extends StatefulWidget {
  const EditarService({
    Key? key,
    required this.servicio,
  });

  final Map<String, dynamic> servicio;

  @override
  _EditarServiceState createState() => _EditarServiceState();
}

class _EditarServiceState extends State<EditarService> {
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
    _nombreController.text = widget.servicio['nombre'];
    _descripcionController.text = widget.servicio['descripcion'];
    _precioController.text = widget.servicio['precio'].toString();
    _estadoController.text = widget.servicio['estado'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Editar Servicio'),
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
                  final Map<String, dynamic> servicioEditado = {
                    '_id': widget.servicio['_id'],
                    'nombre': _nombreController.text,
                    'descripcion': _descripcionController.text,
                    'precio': _precioController.text,
                    'estado': _estadoController.text,
                  };

                  final api = new Servicio();
                  try {
                    await api.editRegistro(servicioEditado);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ServicioP()),
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
