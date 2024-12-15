class TyreDetector {
  TyreDetector({
    required this.file,
    required this.encore,
    required this.result,
    required this.care,
    required this.type,
    required this.time,
  });

  TyreDetector.fromJson(dynamic json) {
    file = json['file'];
    encore = json['encore'];
    result = json['result'];
    care = json['care'];
    type = json['type'];
    time = json['time'];
  }
  late String file;
  late String encore;
  late String result;
  late String care;
  late String type;
  late String time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file'] = file;
    map['encore'] = encore;
    map['result'] = result;
    map['care'] = care;
    map['type'] = type;
    map['time'] = time;
    return map;
  }
}
