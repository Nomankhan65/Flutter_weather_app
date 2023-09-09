import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  var icon;
  var text;
  final Color color;
   MyColumn({Key? key,required this.icon,required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10,right:10),
      child: Column(
        children: [
          Icon(icon,color:color,size:35,),
          const SizedBox(height:10,),
          Text(text,style:const TextStyle(color:Colors.white),),
        ],
      ),
    );
  }
}
