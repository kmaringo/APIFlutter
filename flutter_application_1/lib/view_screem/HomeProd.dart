import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/producto_api.dart';
import 'package:flutter_application_1/view_screem/crearProd.dart';
import 'package:flutter_application_1/view_screem/editarProd.dart';

class ProductoP extends StatefulWidget {
  const ProductoP({super.key});

  @override
  State<ProductoP> createState() => _ProductoPState();
}

class _ProductoPState extends State<ProductoP> {
  late Future <List<Map<String, dynamic>>> obtenerProducto;

  @override
  void initState (){
    super.initState();
    obtenerProducto = _extraerDatos();
  }
  Future <List<Map<String, dynamic>>> _extraerDatos() async{
    final datos = await Producto().obtenerDatos();
    return List<Map<String,dynamic>>.from(datos['producto']);
    
  }

void refrescarDatos (){
  setState(() {
    obtenerProducto = _extraerDatos();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Productos'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: obtenerProducto,
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
            final List<Map<String, dynamic>> productos =
                snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(productos[index]['nombre']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Descripción: ${productos[index]['descripcion']}'),
                        Text('Precio: ${productos[index]['precio']}'),
                        Text('Estado: ${productos[index]['estado']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditarProducto(producto: productos[index],)),
                              );
                        }, icon: const Icon(Icons.edit)),
                        IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Eliminar producto'),
                          content: const Text(
                              '¿Está seguro que desea eliminar este producto?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () async{
                          final api = Producto();
                          Map<String,dynamic>eliminarDato = {
                            '_id': productos[index]['_id']
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
      MaterialPageRoute(builder: (context) => CreateProducto()),
          );
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}



