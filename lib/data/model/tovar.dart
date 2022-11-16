import 'package:pr1/domain/entity/tovar_entity.dart';

class Tovar extends TovarEntity{
  int? id;
  final String tovar_name;
  final int count;
  final String data_p;
  final int id_vidtovara;
  final int id_supplier;
  final int id_unitofmeasurement;



  Tovar({required this.tovar_name, required this.count, required this.data_p, required this.id_vidtovara, required this.id_supplier, required this.id_unitofmeasurement}) : super(tovar_name: tovar_name, count: count, data_p: data_p, id_vidtovara: id_vidtovara, id_supplier:  id_supplier, id_unitofmeasurement: id_unitofmeasurement);

  Map<String, dynamic> ToMap(){
    return{
      'id': id,
      'tovar_name': tovar_name,
      'count': count,
      'data_p': data_p,
      'id_vidtovara': id_vidtovara,
      'id_supplier': id_supplier,
      'id_unitofmeasurement': id_unitofmeasurement,
    };
  }

  factory Tovar.toFromMap(Map<String, dynamic> json){
    return Tovar(tovar_name: json['tovar_name'], count: json['count'], data_p: json['data_p'], id_vidtovara: json['id_vidtovara'], id_supplier: json['id_supplier'], id_unitofmeasurement: json['id_unitofmeasurement'] );
  }

}