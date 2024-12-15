import 'dart:typed_data';

class CarModels {
  Uint8List? dataMain;
  String? name;
  Uint8List? dataSub;
  String? time;
  double? care;
  String? result;
  List<double>? otherCare = [];
  CarModels({
    this.dataSub,this.care,this.name,this.time,this.dataMain,this.otherCare,this.result
  });
}
