import 'package:pr1/domain/entity/vidtovara_entity.dart';

class VidTovara extends VidTovaraEntity{
  int? id;
  final String vidtovara_name;

  VidTovara({required this.vidtovara_name}) : super(vidtovara_name: vidtovara_name);

  Map<String, dynamic> ToMap(){
    return{
      'id': id,
      'vidtovara_name': vidtovara_name
    };
  }

  factory VidTovara.toFromMap(Map<String, dynamic> json){
    return VidTovara(vidtovara_name: json['vidtovara_name']);
  }

}