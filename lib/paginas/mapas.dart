import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapas extends StatefulWidget {
  @override
  _MapasState createState() => _MapasState();
}

List<Marker> listMarkers = [];

double marcador = 1;

class _MapasState extends State<Mapas> {
  @override
  Widget build(BuildContext context) {

    if (marcador >= 1) {
      listMarkers.add(
        Marker(
          markerId: MarkerId('1'),
          position: LatLng(-23.386394, -47.219334),
          infoWindow: InfoWindow(
            title: 'R9'
          ),
          onTap: (){
            return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context){
                return AlertDialog(
                  title: Text('Aviso'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Na portaria, seguir mapa abaixo!'),
                        SizedBox(height: 5),
                        Image.asset('assets/images/mapa.png')
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    Center(
                      child: RaisedButton(
                      color: Color.fromRGBO(0, 102, 51, 1),
                      child: Text('Voltar',style:TextStyle(color: Colors.white)),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),)
                    ),
                    )
                  ],
                );
              }
            );
          }
        )
      );
    }


    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: 
           GoogleMap(
              markers: Set.from(listMarkers),
              scrollGesturesEnabled: false,
              zoomGesturesEnabled: true,
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng(-23.386394, -47.219334),
                zoom: 17
              ),
            ),
          
        
      
    );
  }
}