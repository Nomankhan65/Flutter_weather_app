import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model.dart';
import '../components/my_column.dart';
import '../components/my_row.dart';
class Today extends StatefulWidget {

  const Today({Key? key}) : super(key: key);

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {

 WeatherData weatherData=WeatherData();
 String temp='20';
 String description="Clear";
 String feelLike='18';
 String maxTemp='15';
 String minTemp='12';
 String humidity='51';
 String pressure='1100';
 String seaLevel='98';
 String? speed;
 String? sunrise;
 String? sunset;
 double kelvinToCelsius(double kelvin) {
   return kelvin - 273.15;
 }
 void startApp() async {
   await weatherData.getData();
   setState(() {
     temp = kelvinToCelsius(weatherData.temp).toStringAsFixed(0);
     description = weatherData.description.toString();
     feelLike = kelvinToCelsius(weatherData.feelLike).toStringAsFixed(0);
     maxTemp = kelvinToCelsius(weatherData.maxTemp).toStringAsFixed(0);
     minTemp = kelvinToCelsius(weatherData.minTemp).toStringAsFixed(0);
     humidity = weatherData.humidity.toString();
     pressure = weatherData.pressure.toString();
     seaLevel = weatherData.seaLevel;
     speed = weatherData.speed.toString();
     sunset=weatherData.sunset;
     sunrise=weatherData.sunrise;
   });
 }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startApp();
  }
  //function to convert time Like 10:2 AM
 String formatUnixTimestamp(int unixTimestamp) {
   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
   String formattedDateTime = DateFormat('h:mm a').format(dateTime);
   return formattedDateTime;
 }
 String formatDateTime() {
   final dateFormat = DateFormat('d MMM, hh:mm a');
   return dateFormat.format(DateTime.now());
 }
  @override
  Widget build(BuildContext context) {
    const Color beginColor = Color(0xff97cff0);
    const Color endColor = Color(0xff00bfff);
    const Color sunColor = Color(0xffFFCC33);
    const Color moonColor = Color(0xffE5E5E5);
    final size = MediaQuery
        .of(context)
        .size * 1;
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
                      endColor,
                    ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  //Top row
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Left column
                      Column(
                        children: [
                          Text(
                            formatDateTime(),
                            style: TextStyle(fontSize: 19, shadows: [
                              Shadow(
                                  color: Colors.white.withOpacity(0.6),
                                  offset: const Offset(1, 1),
                                  blurRadius: 2
                              )
                            ]),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            children: [
                                Text('Day $maxTemp°',
                                  style: const TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            color: Colors.black38,
                                            offset: Offset(0, 2),
                                            blurRadius: 1
                                        )
                                      ]
                                  )),
                              SizedBox(width: size.width * 0.01,),
                              const Icon(
                                Icons.circle, size: 6, color: Colors.white,),
                              SizedBox(width: size.width * 0.01,),
                                Text('Night $minTemp°',
                                  style: const TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            color: Colors.black38,
                                            offset: Offset(0, 2),
                                            blurRadius: 1
                                        )
                                      ]
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                '$temp°',
                                style: const TextStyle(
                                    fontSize: 90, color: Colors.white,
                                    shadows: [
                                      Shadow(
                                          color: Colors.black38,
                                          offset: Offset(0, 2),
                                          blurRadius: 1
                                      )
                                    ]
                                ),
                              ),
                              const Text('c', style: TextStyle(
                                  fontSize: 60, color: Colors.white, shadows: [
                                Shadow(
                                    color: Colors.black38,
                                    offset: Offset(0, 2),
                                    blurRadius: 1
                                )
                              ]),),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                            Text('Feels like $feelLike°', style: const TextStyle(
                              fontSize: 18, color: Colors.white, shadows: [
                            Shadow(
                                color: Colors.black38,
                                offset: Offset(0, 1),
                                blurRadius: 1
                            )
                          ]
                          ),)
                        ],
                      ),
                      //Right column
                      Column(
                        children: [
                            const Icon(
                          Icons.circle,
                            color: sunColor,
                            size: 120,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            description,
                            style: const TextStyle(
                                fontSize: 19, color: Colors.white,
                                shadows: [Shadow(
                                    color: Colors.black38,
                                    offset: Offset(0, 1),
                                    blurRadius: 1
                                )
                                ]
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                //Bottom row
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          MyColumn(icon: Icons.circle,
                              text: '2 pm',
                              color: sunColor),
                          MyColumn(icon: Icons.circle,
                              text: '3 pm',
                              color: sunColor),
                          MyColumn(icon: Icons.circle,
                              text: '4 pm',
                              color: sunColor),
                          MyColumn(icon: Icons.circle,
                              text: '5 pm',
                              color: sunColor),
                          MyColumn(icon: Icons.circle,
                              text: '6 pm',
                              color: sunColor),
                          MyColumn(icon: Icons.nights_stay_sharp,
                              text: '7 pm',
                              color: moonColor),
                          MyColumn(icon: Icons.nights_stay_sharp,
                              text: '8 pm',
                              color: moonColor),
                          MyColumn(icon: Icons.nights_stay_sharp,
                              text: '9 pm',
                              color: moonColor),
                          MyColumn(icon: Icons.nights_stay_sharp,
                              text: '10 pm',
                              color: moonColor),
                          MyColumn(icon: Icons.nights_stay_sharp,
                              text: '11 pm',
                              color: moonColor),
                          MyColumn(icon: Icons.nights_stay_sharp,
                              text: '12 am',
                              color: moonColor),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        'No precipitation expected today', style: TextStyle(
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 1
                            )
                          ]),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          const Text('Current detail', style: TextStyle(fontSize: 17),),
          MyRow(title: 'Humidity', text: '$humidity%'),
          MyRow(title: 'Dew points', text: '19c°'),
          MyRow(title: 'Pressure', text: '${pressure}Br'),
          MyRow(title: 'Sea Level', text: seaLevel),
          MyRow(title: 'Speed', text:speed.toString()),
          const Divider(color: Colors.black38, thickness: 0.5,),
          const SizedBox(height: 10,),
          const Text('Sunrise & Sunset', style: TextStyle(fontSize: 17),),
          MyRow(
            title: 'Sunrise',
            text: sunrise != null ? formatUnixTimestamp(int.parse(sunrise!)) : 'N/A',
          ),
          MyRow(
            title: 'Sunset',
            text: sunset != null ? formatUnixTimestamp(int.parse(sunset!)) : 'N/A',
          ),
          MyRow(title: 'Length of day', text: '12h 40m'),
        ],
      ),
    );
  }
}

