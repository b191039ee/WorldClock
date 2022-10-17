import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty? data:ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    //set background
    String bimage= data['isDaytime']? 'Sun.jpeg':'Moon.jpeg';
    Color? bgcolor = data['isDaytime']? Colors.red[500]: Colors.red[900];
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bimage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 140, 0, 0),
            child: Column(
              children:<Widget> [
                TextButton.icon(onPressed:() async {
                 dynamic result= await Navigator.pushNamed(context, '/CountryList');
                 setState(() {
                   data={
                     'location': result['location'],
                     'flag': result['flag'],
                     'time': result['time'],
                     'isDaytime': result['isDaytime'],
                   };
                 });
                } ,
                  icon:Icon(Icons.edit_location,
                  color: Colors.grey[600],),
                  label: Text('Edit Location',
                  style: TextStyle(
                    color: Colors.white,
                  ),),

                ),
                SizedBox(height: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text(data['location'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(data['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 66.0,
                  fontWeight: FontWeight.bold,

                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
