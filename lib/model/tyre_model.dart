import 'dart:typed_data';

class TyreModel {
  Uint8List? dataMain;
  Uint8List? dataSub;
  Uint8List? dataThree;
  String? name;
  String? time;
  double? care;
  String? result;
  TyreModel({this.dataSub,this.dataMain,this.time,this.care,this.name,this.dataThree,this.result});
}
