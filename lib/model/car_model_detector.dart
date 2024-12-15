class CarModelDetector {
  CarModelDetector({
    required this.file,
    required this.resultFile,
    required this.result,
    required this.score,
    required this.time,
    required this.allScores,
  });

  CarModelDetector.fromJson(dynamic json) {
    file = json['file'];
    resultFile = json['resultFile'];
    result = json['result'];
    score = json['score'];
    time = json['time'];
    allScores =
        json['allScores'] != null ? json['allScores'].cast<double>() : [];
  }
  late String file;
  late String resultFile;
  late String result;
  late String score;
  late String time;
  late List<double> allScores;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file'] = file;
    map['resultFile'] = resultFile;
    map['result'] = result;
    map['score'] = score;
    map['time'] = time;
    map['allScores'] = allScores;
    return map;
  }
}
