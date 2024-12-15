import 'package:ai_preview/views/widgets/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../provider/screen_provider.dart';

class CarLayout extends StatelessWidget{
  const CarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(builder: (context,value,child){
      if(value.showResultCar){
        return Column(children: [
          Expanded(child:
          value.selectedCar != null? Row(children: [Expanded(child: Container(padding: const EdgeInsets.all(5),child: Image.memory(value.selectedCar!.dataMain!),)),Expanded(child: Container(padding: const EdgeInsets.all(5),child: Image.memory(value.selectedCar!.dataSub!)))],):Container()),
          Expanded(child:Container(padding: const EdgeInsets.all(10),child:  Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('مدل ${value.selectedCar?.result ??""}',style: Style.text,),
            Container(height: 9,),
            Text('دقت ${value.selectedCar?.care ??""}',style: Style.text),
            Container(height: 9,),
            Text('زمان پردازش ${value.selectedCar?.time??""}',style: Style.text),
            Container(height: 5,),
            Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
              if(value.selectedCar!=null)
                for(int index= 0;index < value.selectedCar!.otherCare!.length;index ++)...{
                  Text('${value.carModels[index]} ${(value.selectedCar!.otherCare![index] * 100)}',style: Style.text.apply(color: Colors.blueGrey),),
                  Container(height: 1,)
                }

            ],),

          ],)))
        ],);
      }else{
        value.showCar();
        return const Center(child: SpinKitRing(color: Colors.blueAccent),);
      }
    });

  }
}