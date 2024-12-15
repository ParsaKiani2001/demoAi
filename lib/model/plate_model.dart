import 'dart:typed_data';

class PlateModel {
  Uint8List? dataMain;
  String? name;
  Uint8List? dataSub;
  String? time;
  double? care;
  String? plate;

  PlateModel({
    this.care,
    this.dataMain,
    this.dataSub,
    this.name,
    this.time,
    this.plate
});
}
