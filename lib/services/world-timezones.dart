import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; //location name for the UI
  late String time;  // time at that location
  String flag;  // url to an asset flag icon
  String url;   //url of location
  late bool isDaytime; //day or night

  WorldTime({required this.location, required this.flag , required this.url});
  Future<void> getTime() async{

   try {
      Response res =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(res.body);
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      //print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 6 && now.hour < 20 ? true:false;
      //set the time property
      time = DateFormat.jm().format(now);
    }
    catch (e){
     print('caught error');
     time='couldnt get time';
    }
  }

}
