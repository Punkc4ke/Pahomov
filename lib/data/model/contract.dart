import 'package:pr1/domain/entity/contract_entity.dart';

class Contract extends ContractEntity{
  int? id;
  final int id_supplier;
  final String dateofconclusion;
  final String validityperiod;
  final int id_tovar;
  final int id_transportcompany;



  Contract({required this.id_supplier, required this.dateofconclusion, required this.validityperiod, required this.id_tovar, required this.id_transportcompany}) : super(id_supplier:  id_supplier, dateofconclusion: dateofconclusion, validityperiod: validityperiod, id_tovar: id_tovar,  id_transportcompany: id_transportcompany);

  Map<String, dynamic> ToMap(){
    return{
      'id': id,
      'id_supplier': id_supplier,
      'dateofconclusion': dateofconclusion,
      'validityperiod': validityperiod,
      'id_tovar': id_tovar,
      'id_transportcompany': id_transportcompany,
    };
  }

  factory Contract.toFromMap(Map<String, dynamic> json){
    return Contract(id_supplier: json['id_supplier'], dateofconclusion: json['dateofconclusion'], validityperiod: json['validityperiod'], id_tovar: json['id_tovar'], id_transportcompany: json['id_transportcompany']);
  }

}