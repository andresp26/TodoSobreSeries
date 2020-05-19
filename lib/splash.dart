import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() { 
    super.initState();
    Timer(Duration( seconds: 1), ()=> MyHome());
  }

  @override
  Widget build(BuildContext context) {     
    return MaterialApp(
     home : vista()
    );    
  }
}

Widget vista() {    
  return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.red),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50.0,
                          child: Icon(Icons.live_tv,
                              color: Colors.red, size: 50.0),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Text('Todo Sobre Series',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Padding(padding: EdgeInsets.only(top:20.0),
                      ),
                      Text('Las mejores series ', style: TextStyle( color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold))
                    ],
                  ))
            ],
          )
        ],
      ),
    );
}



 

class Contenedor extends StatefulWidget {
   
  @override
  _ContenedorState createState() => _ContenedorState();
}

class _ContenedorState extends State<Contenedor> {
 

  @override
  Widget build(BuildContext context) {
    return Container(
        
    );
  }
}
