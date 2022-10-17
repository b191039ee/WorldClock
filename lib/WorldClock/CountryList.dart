import 'package:flutter/material.dart';
import 'package:worldclock/services/world-timezones.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List <WorldTime> locations=[
    WorldTime(location: 'Berlin', flag: 'germany', url: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'uk', url: 'Europe/London'),
    WorldTime(location: 'Cairo', flag: 'egypt', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya', url: 'Africa/Nairobi'),
    WorldTime(location: 'New York', flag: 'usa', url: 'America/New_York'),
    WorldTime(location: 'Chicago', flag: 'usa', url: 'America/Chicago'),
    WorldTime(location: 'Seoul', flag: 'southkor', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia', url: 'Asia/Jakarta'),
 ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
     appBar: AppBar(
       title: Text('LOCATIONS',
       style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 28.0,
         color: Colors.red[900],
       ),),
       backgroundColor: Colors.white,
       centerTitle: true,
       elevation: 0.0,
     ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location,),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${locations[index].flag}.png'),
            ),
            ),

          );
        },
      ),
    );
  }
}
