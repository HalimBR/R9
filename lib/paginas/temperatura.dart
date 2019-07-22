import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:r9_2/json/configs.dart';

class Temperatura extends StatefulWidget {
  @override
  _TemperaturaState createState() => _TemperaturaState();
}

var hora = DateTime.now();
var formato = new DateFormat("dd/MM - hh:mm").format(hora);

class _TemperaturaState extends State<Temperatura> {
  Autogenerated data;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeatherSorocaba(),
      builder: (BuildContext cxt, AsyncSnapshot<Autogenerated> snap){
        if (snap.data == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          data = snap.data;
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 300),
                    TempR9()
                  ],
                ),
                Descri(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(-18, 4, 44, 26),),
                        borderRadius: BorderRadius.circular(20), 
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 20,),
                          Text(formato, style: TextStyle(fontSize: 20),),
                          SizedBox(width: 20,)
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.refresh),
                        onPressed: (){
                          setState(() {
                            hora = DateTime.now();
                            formato = new DateFormat("dd/MM - hh:mm").format(hora);
                            getWeatherSorocaba();
                            
                          });
                        },
                    )
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                Divider(
                  color: Color.fromARGB(-18, 4, 44, 26),
                  height: 10,
                ),

                SizedBox(height: 40,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TempMax(),
                    TempMin()
                  ],
                )
              ],
              
            ),
          );
        }
      },
    );
  }

  Future<Autogenerated> getWeatherSorocaba() async {
    String apiurl = 'http://api.openweathermap.org/data/2.5/weather?q=itu&APPID=cad10e201449793840c0ed7e1b18c8c9&units=metric';
    http.Response response = await http.get(apiurl);
    Autogenerated autogenerated = Autogenerated.fromJson(json.decode(response.body));
    return autogenerated;
  }

  Widget TempR9() {
    Main main = data.main;
    return Row(
      children: <Widget>[
        Text(main.temp.toString(), style: TextStyle(fontSize: 100, color: Color.fromARGB(-18, 4, 44, 26) ),),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('º', style: TextStyle(fontSize: 35, color: Color.fromARGB(-18, 4, 44, 26)),),
                Text('C', style: TextStyle(fontSize: 35, color: Color.fromARGB(-18, 4, 44, 26)))
              ],
            ),
            SizedBox(height: 40,)
          ],
        )
      ],
    );
  }

  Widget TempMax(){
    Main main = data.main;
    return Center(
      child: Column(
        children: <Widget>[
          Text('Temp. Max', style: TextStyle(fontSize: 20, color: Color.fromARGB(-18, 4, 44, 26)),),
          SizedBox(height: 5,),
          Text(main.tempMax.toString(), style: TextStyle(fontSize: 25, color: Color.fromARGB(-18, 4, 44, 26) ),),
        ],
      ),
    );
  }

  Widget TempMin(){
    Main main = data.main;
    return Center(
      child: Column(
        children: <Widget>[
          Text('Temp. Min', style: TextStyle(fontSize: 20, color: Color.fromARGB(-18, 4, 44, 26)),),
          SizedBox(height: 5,),
          Text(main.tempMin.toString(), style: TextStyle(fontSize: 25, color: Color.fromARGB(-18, 4, 44, 26) ),),
        ],
      ),
    );
  }

  Widget Descri(){
    List<Weather> weather = data.weather;
    String iconResult = weather[0].icon;
    return Container();
  }

}