import 'dart:typed_data';
import 'package:ai_preview/views/widgets/style.dart';
import 'package:flutter/material.dart';

class ItemSelecter extends StatelessWidget{
  final String name;
  final Uint8List data;
  final void Function() onClick;

  const ItemSelecter({super.key, required this.name,required this.data,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Material(child: Container(decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.black)),width: MediaQuery.sizeOf(context).width * (2/5),child:InkWell(onTap: (){
      onClick();
    },child:Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,children: [Image.memory(data),Container(width: 5,),Text(name,style: Style.titleText,)],),)));
  }
}