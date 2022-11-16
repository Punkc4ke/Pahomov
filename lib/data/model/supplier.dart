import 'package:pr1/domain/entity/supplier_entity.dart';

class Supplier extends SupplierEntity{
  int? id;
  final String name_org;
  final int id_contactperson;


  Supplier({required this.name_org, required this.id_contactperson}) : super(name_org: name_org, id_contactperson: id_contactperson);

  Map<String, dynamic> ToMap(){
    return{
      'id': id,
      'name_org': name_org,
      'id_contactperson': id_contactperson
    };
  }

  factory Supplier.toFromMap(Map<String, dynamic> json){
    return Supplier(name_org: json['name_org'], id_contactperson: json['id_contactperson']);
  }

}