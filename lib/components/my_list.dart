import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyList extends StatelessWidget {
  var title;
  var subTitle;
  var day;
  var night;
  var icon;
  var iconColor;
  MyList({Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.iconColor,
    required this.day,
    required this.night
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:7),
      child: ListTile(
        title:Text(title),
        subtitle:Text(subTitle),
        trailing:Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Icon(icon,size:55,color:iconColor,),
            const SizedBox(width:20,),
            Column(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                Text(day,style:const TextStyle(fontSize:16),),
                Text(night,style:const TextStyle(color:Colors.black54),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
