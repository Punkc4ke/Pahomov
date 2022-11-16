import 'package:pr1/domain/entity/unitofmeasurement_entity.dart';

class UnitOfMeasurement extends UnitOfMeasurementEntity{
  int? id;
  final String unitofmeasurement_name;

  UnitOfMeasurement({required this.unitofmeasurement_name}) : super(unitofmeasurement_name: unitofmeasurement_name);

  Map<String, dynamic> ToMap(){
    return{
      'id': id,
      'unitofmeasurement_name': unitofmeasurement_name
    };
  }

  factory UnitOfMeasurement.toFromMap(Map<String, dynamic> json){
    return UnitOfMeasurement(unitofmeasurement_name: json['unitofmeasurement_name']);
  }

}