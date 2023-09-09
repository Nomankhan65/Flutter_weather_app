import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/my_column.dart';
import '../components/my_row.dart';

class Tomarro extends StatefulWidget {
  const Tomarro({Key? key}) : super(key: key);

  @override
  State<Tomarro> createState() => _TomarroState();
}

class _TomarroState extends State<Tomarro> {

  @override
  Widget build(BuildContext context) {

    const Color beginColor = Color(0xff97cff0);
    const Color sunColor=Color(0xffFFCC33);
    const Color moonColor=Color(0xffE5E5E5);
    const Color cloudColor=Color(0xfff6f6f6);
    final size = MediaQuery.of(context).size * 1;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.835,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      beginColor,
                      Color(0xff265c83),
                    ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Left column
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Column(
                        children: [
                          Text(
                            'Sunday, 10 Sep, ',
                            style: TextStyle(fontSize: 17, shadows:[
                              Shadow(
                                  color:Colors.white.withOpacity(0.5),
                                  offset:const Offset(1, 1),
                                  blurRadius:2
                              )
                            ]),
                          ),
                          SizedBox(
                            height:size.height*0.02,
                          ),
                          Row(
                            children: [
                              const Text('Day 25°',
                                  style: TextStyle(
                                      fontSize:16,
                                      color: Colors.white,
                                      shadows:[
                                        Shadow(
                                            color:Colors.grey,
                                            offset:Offset(1, 1),
                                            blurRadius:2
                                        )
                                      ]
                                  )),
                              SizedBox(width:size.width*0.01,),
                              const Icon(Icons.circle,size:6,color:Colors.white,),
                              SizedBox(width:size.width*0.01,),
                              const Text('Night 11°',
                                  style: TextStyle(
                                      fontSize:16,
                                      color: Colors.white,
                                      shadows:[
                                        Shadow(
                                            color:Colors.grey,
                                            offset:Offset(1, 1),
                                            blurRadius:2
                                        )
                                      ]
                                  )),
                            ],
                          ),
                          SizedBox(
                            height:size.height*0.02,
                          ),

                          const Text('Mostly Cloudy',style:TextStyle(fontSize:21,color:Colors.white, shadows:[
                            Shadow(
                                color:Colors.grey,
                                offset:Offset(1, 1),
                                blurRadius:2
                            )
                          ]
                          ),),
                        ],
                      ),
                    ),
                    //Right column
                    const Icon(
                      Icons.cloud,
                      color:Color(0xfff6f6f6),
                      size: 100,
                    )
                  ],
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection:Axis.horizontal,
                      child:
                      Row(
                        children: [
                          MyColumn(icon:Icons.cloudy_snowing, text:'2 pm', color:cloudColor),
                          MyColumn(icon:Icons.cloudy_snowing, text:'3 pm', color:cloudColor),
                          MyColumn(icon:Icons.cloudy_snowing, text:'4 pm', color:cloudColor),
                          MyColumn(icon:Icons.circle, text:'5 pm', color:sunColor),
                          MyColumn(icon:Icons.circle, text:'6 pm', color:sunColor),
                          MyColumn(icon:Icons.nights_stay_sharp, text:'7 pm', color:moonColor),
                          MyColumn(icon:Icons.nights_stay_sharp, text:'8 pm', color:moonColor),
                          MyColumn(icon:Icons.nights_stay_sharp, text:'9 pm', color:moonColor),
                          MyColumn(icon:Icons.nights_stay_sharp, text:'10 pm', color:moonColor),
                          MyColumn(icon:Icons.nights_stay_sharp, text:'11 pm', color:moonColor),
                          MyColumn(icon:Icons.nights_stay_sharp, text:'12 am', color:moonColor),
                        ],
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(top:20,bottom:10),
                      child: Text('Low chance of precipitation (10%)',style:TextStyle(
                          color:Colors.white,
                          shadows:[
                            Shadow(
                                color:Colors.grey.withOpacity(0.5),
                                offset:const Offset(1, 1),
                                blurRadius:1
                            )
                          ]),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height:20,),
          const Text('Detail',style:TextStyle(fontSize:17),),
          MyRow(title:'Humidity', text:'55%'),
          MyRow(title:'Dew points', text:'19c°'),
          MyRow(title:'UV index', text:'High,4'),
          MyRow(title:'Sunrise', text:'5:50 am'),
          MyRow(title:'Sunset', text:'6:40 pm'),
        ],
      ),
    );
  }
}
