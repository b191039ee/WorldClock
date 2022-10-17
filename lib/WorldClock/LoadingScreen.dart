import 'package:flutter/material.dart';
import 'package:worldclock/services/world-timezones.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
 class Loading extends StatefulWidget {
   const Loading({Key? key}) : super(key: key);
 
   @override
   State<Loading> createState() => _LoadingState();
 }
 
 class _LoadingState extends State<Loading> {
   
   void setupWorldTime() async {
     WorldTime instance =WorldTime(location: 'Berlin', flag: 'germany', url: 'Europe/Berlin');
     await instance.getTime();

      Navigator.pushReplacementNamed(context, '/Home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,

      });
 }
 @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.red[900],
       body: Center(
         child: SpinKitFadingCircle(
           color: Colors.white,
           size: 70.0,
         ),
       )
     );
   }
 }
 