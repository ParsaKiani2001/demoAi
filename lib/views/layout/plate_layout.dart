import 'package:ai_preview/provider/screen_provider.dart';
import 'package:ai_preview/views/widgets/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class PlateLayout extends StatelessWidget{
  const PlateLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(builder: (context,value,child){
      if(value.showResultPlate){
        return Column(children: [
          Expanded(child:
          value.selectedPlate != null ? Row(children: [Expanded(child: Container(padding: const EdgeInsets.all(5),child: Image.memory(value.selectedPlate!.dataMain!),)),Expanded(child: Container(padding: const EdgeInsets.all(5),child: Image.memory(value.selectedPlate!.dataSub!),),)],): Container())
          ,
          Expanded(child:Container(padding: const EdgeInsets.all(10),child:  Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('پلاک ',style: Style.text,textDirection: TextDirection.ltr,),
            Container(height: 2,),
            Text(value.selectedPlate?.plate ?? "",style: Style.text),
            Container(height: 9,),
            Text('دقت ${value.selectedPlate?.care ?? ""}',style: Style.text),
            Container(height: 9,),
            Text('زمان پردازش ${value.selectedPlate?.time ?? ""}',style: Style.text),
            Container(height: 9,),
          ],)))
        ],);
      }else{
        value.showPlate();
        return const Center(child: SpinKitRing(color: Colors.blueAccent),);
      }
    });

  }
}