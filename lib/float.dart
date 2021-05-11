

import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

/// This is the main application widget.
// class MyApp extends StatelessWidget {
//   // static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp();
     
    
//   }
// }

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
//  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
  children: <Widget>[
    Align(
      alignment: Alignment.bottomLeft,
      child: FloatingActionButton(
                heroTag: null,
             onPressed: () {
          // Add your onPressed code here!
        },
        
        child: Icon(Icons.bike_scooter),
        backgroundColor: Colors.pink,),
    ),
    Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
                heroTag: null,
             onPressed: () {
          // Add your onPressed code here!
        },
       
        child: Icon(Icons.car_repair),
        
        backgroundColor: Colors.pink,),
    ),
  ],
)
      
      
    );
  }

  
}






