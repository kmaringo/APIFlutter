import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/service/data_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;
  late ProductosModel dataFromAPI;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    try {
      String url = "https://proyectofinalnode.onrender.com/api/paquete/";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        setState(() {
          dataFromAPI = productosModelFromJson(res.body);
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Paquete"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final paquete = dataFromAPI.paquete[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        title: Text(paquete.nombre),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(paquete.descripcion),
                            Text("Precio: ${paquete.precio.toString()}"),
                            Text(paquete.estado),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: dataFromAPI.paquete.length,
            ),
    );
  }
}
