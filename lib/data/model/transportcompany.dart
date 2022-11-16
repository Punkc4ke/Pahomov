import 'package:pr1/domain/entity/transportcompany_entity.dart';

class TransportCompany extends TransportCompanyEntity{
  int? id;
  final String company_name;
  final String contactphone;


  TransportCompany({required this.company_name, required this.contactphone}) : super(company_name: company_name, contactphone: contactphone);

  Map<String, dynamic> ToMap(){
    return{
      'id': id,
      'company_name': company_name,
      'contactphone': contactphone
    };
  }

  factory TransportCompany.toFromMap(Map<String, dynamic> json){
    return TransportCompany(company_name: json['company_name'], contactphone: json['contactphone']);
  }

}