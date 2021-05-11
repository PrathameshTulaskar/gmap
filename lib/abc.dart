// import 'package:floating_action_bubble/floating_action_bubble.dart';
// import 'package:flutter/material.dart';

// import 'searchBox.dart';

// import 'dart:async';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:floating_action_bubble/floating_action_bubble.dart';

// void main() {
//   runApp(MaterialApp(
//     title: "SampleApp",
//     // routes: {
//     //     '/extractArguments': (context) => SearchBoxWidget(),
//     //     '/extractArguments1': (context) => GoogleMapWidget(),
//     //   },
//     home: GoogleMapWidget(),
//   ));
// }

// class GoogleMapWidget extends StatefulWidget {
//   @override
//   _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
// }

// class _GoogleMapWidgetState extends State<GoogleMapWidget>
//     with SingleTickerProviderStateMixin {
//   List<Marker> myMarkers = [];
//   Animation<double> _animation;
//   AnimationController _animationController;
//   Completer<GoogleMapController> _controller = Completer();
//   static LatLng _center = LatLng(15.602961, 73.8251054);
//   final Set<Marker> _markers = {};
//   LatLng _lastMapPosition = const LatLng(10.521563, -11.677433);
//   MapType _currentMapType = MapType.normal;

//   static CameraPosition _position1 = CameraPosition(
//     bearing: 192.833,
//     target: LatLng(16.0407988, 73.4610178),
//     tilt: 59.440,
//     zoom: 11.0,
//   );
//   static CameraPosition _position2 = CameraPosition(
//     bearing: 192.833,
//     target: LatLng(15.7585118, 73.8928387),
//     tilt: 59.440,
//     zoom: 11.0,
//   );

//   var floatingActionButton;

//   Future<void> _goToPosition1() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
//   }

//   Future<void> _goToPosition2() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_position2));
//   }

//   _onMapCreated(GoogleMapController controller) {
//     _controller.complete(controller);
//   }

//   _onCameraMove(CameraPosition position) {
//     _lastMapPosition = position.target;
//   }

//   Widget button(Function function, IconData icon) {
//     return FloatingActionButton(
//       onPressed: function,
//       materialTapTargetSize: MaterialTapTargetSize.padded,
//       backgroundColor: Colors.blue,
//       child: Icon(
//         icon,
//         size: 36.0,
//       ),
//     );
//   }

//   @override
//   void initState() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 260),
//     );

//     final curvedAnimation =
//         CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
//     _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
//     super.initState();
//   }

//   List<Marker> myMarker = [];
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
//   @override
//   Widget build(BuildContext context) {
//     // CLASS MEMBER, MAP OF MARKS

//     void _add() {
//       print("+++++++_+_+_______________________");
//       var markerIdVal = "tempMarkerId";
//       final MarkerId markerId = MarkerId(markerIdVal);

//       void _onMarkerTapped(MarkerId markerId) {
//         final Marker tappedMarker = markers[markerId];
//         if (tappedMarker != null) {
//           setState(() {
//             // if (markers.containsKey(selectedMarker)) {
//             //   final Marker resetOld = markers[selectedMarker]
//             //       .copyWith(iconParam: BitmapDescriptor.defaultMarker);
//             //   markers[selectedMarker] = resetOld;
//             // }
//             // selectedMarker = markerId;
//             final Marker newMarker = tappedMarker.copyWith(
//               iconParam: BitmapDescriptor.defaultMarkerWithHue(
//                 BitmapDescriptor.hueGreen,
//               ),
//             );
//             markers[markerId] = newMarker;
//           });
//         }
//       }

//       // creating a new MARKER
//       Marker marker1 = Marker(
//         markerId: markerId,
//         position: LatLng(16.0407988, 73.4610178),
//         infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
//         onTap: () {
//           _onMarkerTapped(markerId);
//         },
//       );

//       Marker marker2 = Marker(
//         markerId: markerId,
//         position: LatLng(15.7585118, 73.8928387),
//         infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
//         onTap: () {
//           _onMarkerTapped(markerId);
//         },
//       );

//       setState(() {
//         // adding a new marker to map
//         _position1 = CameraPosition(
//           bearing: 192.833,
//           target: LatLng(16.0407988, 73.4610178),
//           tilt: 59.440,
//           zoom: 11.0,
//         );
//         markers[markerId] = marker1;

//         _goToPosition1();

//         _position2 = CameraPosition(
//           bearing: 192.833,
//           target: LatLng(15.7585118, 73.8928387),
//           tilt: 59.440,
//           zoom: 11.0,
//         );

//         markers[markerId] = marker2;

//         _goToPosition2();
//       });
//     }

//     // var bottomNavigationBar;
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

//       //Init Floating Action Bubble
//       floatingActionButton: FloatingButtonsAnim(
//           animation: _animation,
//           animationController: _animationController,
//           bikeBtnFunc: () => _add(),
//           carBtnFunc: () => _add()),
//       // appBar: AppBar(
//       //   title: Text("GoogleMap"),
//       //   backgroundColor: Colors.blue,
//       // ),

// //BOTTOM_NAVIGATION_BAR

//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Mechanism',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         selectedItemColor: Colors.amber[800],
//       ),

// //     STACK
//       body: Stack(
//         children: <Widget>[
// //GoogleMap

//           GoogleMap(
//             onMapCreated: (GoogleMapController controller) {
//               _controller.complete(controller);
//             },
//             myLocationEnabled: true,
//             initialCameraPosition: CameraPosition(
//               target: _center,
//               zoom: 13.0,
//             ),
//             markers: Set<Marker>.of(markers.values),

//             // markers:Set.from(myMarkers),
//           ),

// //SEARCH-BOX-WIDGET
//           Positioned(
//             top: 60,
//             height: 40,
//             left: 0,
//             right: 0,
//             child: SearchBoxWidget(),
//           ),

//           Padding(
//             padding: EdgeInsets.all(0.60),
//             child: Align(
//               alignment: Alignment.centerRight,
//               child: Column(
//                 children: <Widget>[
//                   button(_goToPosition1, Icons.location_searching),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FloatingButtonsAnim extends StatelessWidget {
//   Function bikeBtnFunc;
//   Function carBtnFunc;
//   FloatingButtonsAnim({
//     this.bikeBtnFunc,
//     this.carBtnFunc,
//     Key key,
//     @required Animation<double> animation,
//     @required AnimationController animationController,
//   })  : _animation = animation,
//         _animationController = animationController,
//         super(key: key);

//   final Animation<double> _animation;
//   final AnimationController _animationController;

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionBubble(
//       // Menu items

//       items: <Bubble>[
//         // Floating action menu item
//         Bubble(
//           title: "Bike",
//           iconColor: Colors.white,
//           bubbleColor: Colors.blue,
//           icon: Icons.search,
//           titleStyle: TextStyle(fontSize: 16, color: Colors.white),
//           onPress: this.bikeBtnFunc,
//         ),
//         // Floating action menu item
//         Bubble(
//           title: "Car",
//           iconColor: Colors.white,
//           bubbleColor: Colors.blue,
//           icon: Icons.search,
//           titleStyle: TextStyle(fontSize: 16, color: Colors.white),
//           onPress: this.carBtnFunc,
//         ),
//       ],

//       // animation controller
//       animation: _animation,

//       // On pressed change animation state
//       onPress: () => _animationController.isCompleted
//           ? _animationController.reverse()
//           : _animationController.forward(),

//       // Floating Action button Icon color
//       iconColor: Colors.blue,

//       // Flaoting Action button Icon
//       iconData: Icons.help,
//       backGroundColor: Colors.white,
//     );
//   }
// }
