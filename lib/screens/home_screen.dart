import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:weather/screens/Today.dart';
import 'package:weather/screens/Tomarrow.dart';
import 'package:weather/screens/ten_days.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    const Color myColor = Color(0xff0f9dd5);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading:false,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: myColor,
                systemNavigationBarColor:Colors.transparent,
                systemNavigationBarIconBrightness: Brightness.dark),
            backgroundColor: myColor,
            centerTitle:true,
            title: Container(
              height: 45,
              width:400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child:const TextField(
                decoration:InputDecoration(
                  hintText:'Search Location',
                  prefixIcon:Icon(Icons.search,),
                  suffixIcon:Padding(
                    padding: EdgeInsets.all(3),
                    child: CircleAvatar(
                      foregroundImage:NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600',
                      ),
                    ),
                  )
                ),
              )
            ),
            bottom: const TabBar(
                indicatorWeight:10,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(5),topRight:Radius.circular(5))),
                labelPadding: EdgeInsets.all(5),
                tabs: [
                  Text('Today',
                      style: TextStyle(
                        fontSize: 17,
                      )),
                  Text('Tomorrow',
                      style: TextStyle(
                        fontSize: 17,
                      )),
                  Text('10 Days',
                      style: TextStyle(
                        fontSize: 17,
                      )),
                ]),
          ),
          body:   const TabBarView(children: [

            Today(),
            Tomarro(),
            TenDays()

          ])),
    );
  }
}
