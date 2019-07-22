import 'package:flutter/material.dart';
import 'package:r9_2/paginas/mapas.dart';
import 'package:r9_2/paginas/social.dart';
import 'package:r9_2/paginas/temperatura.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

    int pageIndex = 0;



   final Temperatura _temperatura = Temperatura();
   final Mapas _mapas = Mapas();
   final Social _social = Social();
   

   Widget _showPage =  Temperatura();


   Widget _pageChooser(int page){
     switch (page) {
       case 0: 
       return _temperatura;
       case 1:
       return _mapas;
       case 2: 
       return _social;
     }
   }

class _HomeState extends State<Home> {
  @override

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        title: Text('R9'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(-18, 4, 44, 26),
        bottom: TabBar(
          indicatorColor: (Colors.green),
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.brightness_4),
            ),
            Tab(
              icon: Icon(Icons.map),
            ),
            Tab(
              icon: Icon(Icons.info),
            )
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          _temperatura,
          _mapas,
          _social
        ],
      )
    ),
    );
  }
}