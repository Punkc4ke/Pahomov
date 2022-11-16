
class ContractEntity{
   int? id;
  final String dateofconclusion;
  final String validityperiod;
  late int id_supplier;
  late int id_tovar;
  late int id_transportcompany;

  ContractEntity({required this.dateofconclusion, required this.validityperiod, required this.id_supplier, required this.id_tovar, required this.id_transportcompany});

}