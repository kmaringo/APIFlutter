import 'dart:convert';

ProductosModel productosModelFromJson(String str) => ProductosModel.fromJson(json.decode(str));

String productosModelToJson(ProductosModel data) => json.encode(data.toJson());

class ProductosModel {
  ProductosModel({
    required this.paquete,
  });

  List<Paquete> paquete;

  factory ProductosModel.fromJson(Map<String, dynamic> json) => ProductosModel(
    paquete: List<Paquete>.from(json["paquete"].map((x) => Paquete.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "paquete": List<dynamic>.from(paquete.map((x) => x.toJson())),
  };
}

class Paquete {
  Paquete({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.estado,
    required this.v,
  });

  String id;
  String nombre;
  String descripcion;
  double precio;
  String estado;
  int v;

  factory Paquete.fromJson(Map<String, dynamic> json) => Paquete(
    id: json["_id"],
    nombre: json["nombre"],
    descripcion: json["descripcion"],
    precio: json["precio"].toDouble(),
    estado: json["estado"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "nombre": nombre,
    "descripcion": descripcion,
    "precio": precio,
    "estado": estado,
    "__v": v,
  };
}
