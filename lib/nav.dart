import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     title: '',
//     home: Home(),
//   ));
// }
class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       
     ),
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           // ignore: deprecated_member_use
           title: new Text('Home'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.call),
           // ignore: deprecated_member_use
           title: new Text('Mechanism'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           // ignore: deprecated_member_use
           title: Text('Profile')
         ),
         


       ],
     ),
   );
 }
}