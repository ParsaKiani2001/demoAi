class PlateDetector {
  PlateDetector({
    required this.file,
    required this.result,
    required this.care,
    required this.time,
    required this.platecode,
    required this.name
  });

  PlateDetector.fromJson(dynamic json) {
    file = json['file'] ?? "";
    result = json['result'] ?? "";
    care = json['care'] ?? "";
    time = json['time'] ?? "";
    platecode = json['plate-code'] ?? "";
    name = json['name'] ?? "";
  }
  late String name;
  late String file;
  late String result;
  late String care;
  late String time;
  late String platecode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file'] = file;
    map['result'] = result;
    map['care'] = care;
    map['time'] = time;
    map['plate-code'] = platecode;
    map['name'] = name;
    return map;
  }
}
