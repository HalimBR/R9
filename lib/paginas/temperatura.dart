import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Temperatura extends StatefulWidget {
  @override
  _TemperaturaState createState() => _TemperaturaState();
}

var hora = DateTime.now();
var formato = new DateFormat("dd/MM - hh:mm").format(hora);

class _TemperaturaState extends State<Temperatura> {
  @override
  Widget build(BuildContext context) {
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

  Future<Map> getWeatherSorocaba() async {
    String apiurl = 'http://api.openweathermap.org/data/2.5/weather?q=itu&APPID=cad10e201449793840c0ed7e1b18c8c9&units=metric';
    http.Response response = await http.get(apiurl);
    return json.decode(response.body);
  }

  Widget TempR9() {
    return FutureBuilder(
      future: getWeatherSorocaba(),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData){
          Map content =snapshot.data;
          return Row(
            children: <Widget>[
              Text(content['main']['temp'].toString(), style: TextStyle(fontSize: 100, color: Color.fromARGB(-18, 4, 44, 26) ),),
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
        else{
          return Text('Sem Internet');
        }
      }
    );
  }

  Widget TempMax(){
    return FutureBuilder(
      future: getWeatherSorocaba(),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData){
          Map content =snapshot.data;
          return Center(
            child: Column(
              children: <Widget>[
                Text('Temp. Max', style: TextStyle(fontSize: 20, color: Color.fromARGB(-18, 4, 44, 26)),),
                SizedBox(height: 5,),
                Text(content['main']['temp_max'].toString(), style: TextStyle(fontSize: 25, color: Color.fromARGB(-18, 4, 44, 26) ),),
              ],
            ),
          );
        }
        else{
          return Text('Sem Internet');
        }
      }
    );
  }

  Widget TempMin(){
    return FutureBuilder(
      future: getWeatherSorocaba(),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData){
          Map content =snapshot.data;
          return Center(
            child: Column(
              children: <Widget>[
                Text('Temp. Min', style: TextStyle(fontSize: 20, color: Color.fromARGB(-18, 4, 44, 26)),),
                SizedBox(height: 5,),
                Text(content['main']['temp_min'].toString(), style: TextStyle(fontSize: 25, color: Color.fromARGB(-18, 4, 44, 26) ),),
              ],
            ),
          );
        }
        else{
          return Text('Sem Internet');
        }
      }
    );
  }

  Widget Descri(){
    return FutureBuilder(
      future: getWeatherSorocaba(),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData){
          Map content = snapshot.data;

          



          return Center();
        }
        else{
          return Text('Sem Internet');
        }
      }
    );

  }

}