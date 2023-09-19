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
  String? _errorTextNombre;
  String? _errorTextDescripcion;
  String? _errorTextPrecio;
  String? _errorTextEstado;

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
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  setState(() {
                    _errorTextNombre = 'Por favor, ingresa un nombre';
                  });
                  return 'Por favor, ingresa un nombre';
                }

                setState(() {
                  _errorTextNombre = null;
                });
                return null;
              },
            ),

            TextFormField(
              controller: _descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  setState(() {
                    _errorTextDescripcion = 'Por favor, ingresa una descripción';
                  });
                  return 'Por favor, ingresa una descripción';
                }

                setState(() {
                  _errorTextDescripcion = null;
                });
                return null;
              },
            ),

            TextFormField(
              controller: _precioController,
              decoration: InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  setState(() {
                    _errorTextPrecio = 'Por favor, ingresa un precio';
                  });
                  return 'Por favor, ingresa un precio';
                }

              

                setState(() {
                  _errorTextPrecio = null;
                });
                return null;
              },
            ),

            TextFormField(
              controller: _estadoController,
              decoration: const InputDecoration(labelText: 'Estado'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  setState(() {
                    _errorTextEstado = 'Por favor, ingresa un estado';
                  });
                  return 'Por favor, ingresa un estado';
                }

                setState(() {
                  _errorTextEstado = null;
                });
                return null;
              },
            ),

              const SizedBox(height: 20),
              ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final String nombre = _nombreController.text;
                  final String descripcion = _descripcionController.text;
                  final double precio = double.parse(_precioController.text);
                  final String estado = _estadoController.text;

                  final Map<String, dynamic> servicioEditado = {
                    '_id': widget.servicio['_id'], 
                    'nombre': nombre,
                    'descripcion': descripcion,
                    'precio': precio,
                    'estado': estado,
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
