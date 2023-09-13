import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/servicio_api.dart';
import 'package:flutter_application_1/view_screem/crear.dart';
import 'package:flutter_application_1/view_screem/editar.dart';

class ServicioP extends StatefulWidget {
  const ServicioP({super.key});

  @override
  State<ServicioP> createState() => _ServicioPState();
}

class _ServicioPState extends State<ServicioP> {
  late Future <List<Map<String, dynamic>>> obtenerServicio;

  @override
  void initState (){
    super.initState();
    obtenerServicio = _extraerDatos();
  }
  Future <List<Map<String, dynamic>>> _extraerDatos() async{
    final datos = await Servicio().obtenerDatos();
    return List<Map<String,dynamic>>.from(datos['servicio']);
    
  }

void refrescarDatos (){
  setState(() {
    obtenerServicio = _extraerDatos();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Servicios'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: obtenerServicio,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<Map<String, dynamic>> servicios =
                snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
            itemCount: servicios.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(servicios[index]['nombre']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Descripción: ${servicios[index]['descripcion']}'),
                        Text('Precio: ${servicios[index]['precio']}'),
                        Text('Estado: ${servicios[index]['estado']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditarService(servicio: servicios[index],)),
                              );
                        }, icon: const Icon(Icons.edit)),
                        IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Eliminar servicio'),
                          content: const Text(
                              '¿Está seguro que desea eliminar este servicio?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () async{
                          final api = Servicio();
                          Map<String,dynamic>eliminarDato = {
                            '_id': servicios[index]['_id']
                          };
                          await api.deleRegistro(eliminarDato);
                          Navigator.of(context).pop();
                          
                        
                                
                                refrescarDatos();
                              },
                              child: const Text('Eliminar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey, 
                    thickness: 1.0,     
                    height: 16.0,       
      ), 
      ],
    );
  },
);

      }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateService()),
          );
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}



