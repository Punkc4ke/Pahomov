class TovarEntity{
  int? id;
  final String tovar_name;
  final int count;
  final String data_p;
  late int id_supplier;
  late int id_vidtovara;
  late int id_unitofmeasurement;

  TovarEntity({required this.tovar_name, required this.count, required this.data_p, required this.id_supplier, required this.id_vidtovara, required this.id_unitofmeasurement});

}