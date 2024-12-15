import 'dart:convert';

import 'package:ai_preview/model/car_model.dart';
import 'package:ai_preview/model/car_model_detector.dart';
import 'package:ai_preview/model/plate_detector.dart';
import 'package:ai_preview/model/plate_model.dart';
import 'package:ai_preview/model/tyre_detector.dart';
import 'package:ai_preview/model/tyre_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ScreenProvider extends ChangeNotifier {
  int selectedScreen = 0;

  bool showResultCar = true;
  bool showResultPlate = true;
  bool showResultTyre = true;

  CarModels? selectedCar;
  PlateModel? selectedPlate;
  TyreModel? selectedTyre;

  List<String> carModels = [];
  List<CarModels> carModelData = [];
  List<PlateModel> plateModelData = [];
  List<TyreModel> tyreModelData = [];

  void setState() {
    notifyListeners();
  }

  void showCar(){
    Future.delayed(const Duration(milliseconds: 500),(){
      showResultCar = true;
      setState();
    });
  }

  void showTyre(){
    Future.delayed(const Duration(milliseconds: 500),(){
      showResultTyre = true;
      setState();
    });
  }

  void showPlate(){
    Future.delayed(const Duration(milliseconds: 500),(){
      showResultPlate = true;
      setState();
    });
  }

  void initialize()async{
    String json =await rootBundle.loadString('jsons/plate.json');
    List<PlateDetector> plates = (jsonDecode(json) as List<dynamic>).map((x)=>PlateDetector.fromJson(x)).toList();
    plateModelData.clear();
    for (var x in plates) {
      plateModelData.add(PlateModel(care: double.tryParse(x.care),plate: x.platecode,name: x.file,time: x.time,dataMain: (await rootBundle.load(x.file)).buffer.asUint8List(),dataSub: (await rootBundle.load(x.result)).buffer.asUint8List()));
    }
    json =await rootBundle.loadString('jsons/car-data.json');
    List<CarModelDetector> cars = (jsonDecode(json) as List<dynamic>).map((x)=>CarModelDetector.fromJson(x)).toList();
    carModelData.clear();
    for (var x in cars) {
      carModelData.add(CarModels(otherCare: x.allScores,care: double.tryParse(x.score),result: x.result,name: x.file,time: x.time,dataMain: (await rootBundle.load(x.file)).buffer.asUint8List(),dataSub: (await rootBundle.load(x.resultFile)).buffer.asUint8List()));
    }
    json =await rootBundle.loadString('jsons/tyre.json');
    List<TyreDetector> tyre = (jsonDecode(json) as List<dynamic>).map((x)=>TyreDetector.fromJson(x)).toList();
    tyreModelData.clear();
    for (var x in tyre) {
      tyreModelData.add(TyreModel(care: double.tryParse(x.care),result: x.type,name: x.file,time: x.time,dataMain: (await rootBundle.load(x.file)).buffer.asUint8List(),dataSub: (await rootBundle.load(x.encore)).buffer.asUint8List(),
          dataThree: (await rootBundle.load(x.result)).buffer.asUint8List()));
    }
    json = await rootBundle.loadString('jsons/car.json');
    List<dynamic> data= jsonDecode(json);
    carModels.clear();
    carModels = data.cast<String>();
  }
}
