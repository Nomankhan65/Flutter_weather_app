import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  var title;
  var text;
  MyRow({Key? key,required this.title,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:7,bottom:7),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        children: [
          Text(title,style:const TextStyle(color:Colors.black54),),
          Text(text),
        ],
      ),
    );
  }
}
