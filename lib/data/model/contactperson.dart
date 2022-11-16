import 'package:pr1/domain/entity/contactperson_entity.dart';

class ContactPerson extends ContactPersonEntity{
  int? id;
  final String familia;
  final String name;
  final String otchestvo;
  final String phone;


  ContactPerson({required this.familia, required this.name, required this.otchestvo, required this.phone}) : super(familia: familia, name: name, otchestvo: otchestvo, phone: phone);

  Map<String, dynamic> ToMap(){
    return{
      'id': id,
      'familia': familia,
      'name': name,
      'otchestvo': otchestvo,
      'phone': phone
    };
  }

  factory ContactPerson.toFromMap(Map<String, dynamic> json){
    return ContactPerson(familia: json['familia'], name: json['name'], otchestvo: json['otchestvo'], phone: json['phone']);
  }

}