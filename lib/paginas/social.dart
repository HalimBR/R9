import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[

          SizedBox(height: 60,),


          Center(
            child: Column(
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Text('Conheça as chácaras participantes', style: TextStyle(fontSize: 20, color: Color.fromARGB(-18, 4, 44, 26)), ),
                      Text('da R9!', style: TextStyle(fontSize: 20, color: Color.fromARGB(-18, 4, 44, 26)),)
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Botao(),

                SizedBox(height: 20),

                Text('Redes Sociais R9', style: TextStyle(fontSize: 20, color: Color.fromARGB(-18, 4, 44, 26)),),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: Image.asset('assets/images/facebook.png', height: 45,),
                      onTap: (){
                        _facebook();
                      },
                    )
                  ],
                ),

                SizedBox(height: 10),
                Divider(
                  color: Color.fromARGB(-18, 4, 44, 26),
                  height: 3,
                ),
                SizedBox(height: 10,),

                Image.asset('assets/images/r9.png', height: 280,)



              ],
            ),
          )

        ],
      ),
      
    );
  }


  Widget Botao() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5,),
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 2, color: Color.fromARGB(-18, 4, 44, 26),)
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            _chacaras();
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Ver', style: TextStyle(color: Color.fromARGB(-18, 4, 44, 26), ))
              ],
            ),
          )
        ),
      )
    );
  }

  _facebook() async {
  const url = 'https://www.facebook.com/chacaras.itumairinque';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


  _chacaras(){
   return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context){
                return AlertDialog(
                  title: Text('Chácaras:', style: TextStyle(color: Color.fromARGB(-18, 4, 44, 26),)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text('Famiglia Cattani', style: TextStyle(color: Color.fromARGB(-18, 4, 44, 26),)),
                        SizedBox(height: 3,),
                        Text('Anjovile', style: TextStyle(color: Color.fromARGB(-18, 4, 44, 26),)),
                        SizedBox(height: 3,),
                        Text('Antonio & João', style: TextStyle(color: Color.fromARGB(-18, 4, 44, 26),)),
                        SizedBox(height: 3,),
                        Text('Dois Reis', style: TextStyle(color: Color.fromARGB(-18, 4, 44, 26),)),
                        SizedBox(height: 3,),
                        Text('Recanto Gáucho', style: TextStyle(color: Color.fromARGB(-18, 4, 44, 26),)),
                        SizedBox(height: 3,),
                        Text('Pelegus', style: TextStyle(color: Color.fromARGB(-18, 4, 44, 26),)),
                        SizedBox(height: 3,),
                        Text('Chácara do Portuga', style: TextStyle(color: Color.fromARGB(-18, 4, 44, 26),)),
                        SizedBox(height: 3,),
                        Text('Recanto do Lago', style: TextStyle(color: Color.fromARGB(-18, 4, 44, 26),)),
                        
                        
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
}