
import 'package:ai_preview/provider/screen_provider.dart';
import 'package:ai_preview/views/widgets/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class TyreLayout extends StatelessWidget{
  const TyreLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(builder: (context,value,child){
      if(value.showResultTyre){
        return Column(children: [
          Expanded(child:
          value.selectedTyre != null ? Row(children: [Expanded(child: Container(padding: const EdgeInsets.all(5),child: Image.memory(value.selectedTyre!.dataMain!),)),Expanded(child: Container(padding: const EdgeInsets.all(5),child: Image.memory(value.selectedTyre!.dataSub!))),
            Expanded(child: Container(padding: const EdgeInsets.all(5),child: Image.memory(value.selectedTyre!.dataThree!)))],):Container()),
          Expanded(child:Container(padding: const EdgeInsets.all(10),child:  Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('وضعیت تایر ${value.selectedTyre?.result??""}',style: Style.text,),
            Container(height: 9,),
            Text('دقت ${value.selectedTyre?.care??""}',style: Style.text),
            Container(height: 9,),
            Text('زمان پردازش ${value.selectedTyre?.time??""}',style: Style.text),
            Container(height: 9,),
          ],)))
        ],);
      }else{
        value.showTyre();
        return const Center(child: SpinKitRing(color: Colors.blueAccent),);
      }
    });

  }
}