import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gmap/firestore_service.dart';
import 'package:gmap/user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart' as locationCheck;

import 'package:url_launcher/url_launcher.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_parser/youtube_parser.dart';

class AppState extends ChangeNotifier {
  LatLng _getCurrentLatLng;
  LatLng get getCurrentLatLng => _getCurrentLatLng;
  // Orders razorPayOrderApi = Orders();
  bool initialSliderCheck = false;
  YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: getIdFromUrl('https://youtu.be/0B_2azcHk-w'),
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );
   bool _userdetailFunctionFired = false;
  bool get userdetailFunctionFired => _userdetailFunctionFired;
  bool _deliverySelected = true;
  bool get deliverySelected => _deliverySelected;
  // set deliveryMethodSet(value){
  bool _reviewPageError = false;
  bool get reviewPageError => _reviewPageError;
  set reviewPageErrorSetter(value) {
    _reviewPageError = value;
    notifyListeners();
  }

  // }
  deliveryMethodSet(bool deliverySelected) {
    _deliverySelected = deliverySelected;
    notifyListeners();
  }

  bool _userExistsDb;
  bool get userExistsDb => _userExistsDb;
  bool _limitedStockWarn = false;
  bool get limitedStockWarn => _limitedStockWarn;
  set limitedStockWarnSet(bool value) {
    _limitedStockWarn = value;
  }

  bool _locationStatus;
  bool get locationStatus => _locationStatus;
  int _orderSlotSelected = 0;
  var _limitStockList = <int>[];
  int _couponDiscount = 0;
  set couponDiscountSet(value) {
    _couponDiscount = value;
    notifyListeners();
  }

  bool _couponAllowed = false;
  bool get couponAllowed => _couponAllowed;
  int get couponDiscount => _couponDiscount;
  List<int> get limitStockList => _limitStockList;

  String _customerId;
  set customerIdSet(value) {
    _customerId = value;
  }

  String _documentIdOrder;
  LatLng _currentPosition;
  bool _deliveryHubAvailable = false;
  bool get deliveryHubAvailable => _deliveryHubAvailable;
  set setLocation(LatLng value) {
    _currentPosition = value;
    //fetchNearbySupermarkets();
  }

  UserModel _userData;
  resetUserData() {
    _userData = UserModel();
  }

  TextEditingController couponCode = TextEditingController();
  TextEditingController userNameReg = TextEditingController();
  TextEditingController fullNameReg = TextEditingController();
  TextEditingController emailReg = TextEditingController();
  TextEditingController birthDateReg = TextEditingController();
  TextEditingController contactNumberReg = TextEditingController();
  //////////////////LocationADD Form
  TextEditingController location = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController houseNo = TextEditingController();
  TextEditingController landMark = TextEditingController();
  TextEditingController otherLocation = TextEditingController();
  //////////////////
  UserModel get userData => _userData;
  TextEditingController reviewDescirption = TextEditingController();
  FirestoreService firestoreService = FirestoreService();
  List<String> _sliderUrlS = [];
 

  DocumentSnapshot lastProductDocument;
  DocumentSnapshot lastOrderDocument;

  FirebaseAuth _userAuth = FirebaseAuth.instance;


  List<String> get sliderUrlS => _sliderUrlS;
  LatLng get currentPosition => _currentPosition;
  String get customerId => _customerId;
  
  

  
 
  //////////////////LocationADD Form
 
  //////////////////

 

  AppState() {
    print("AppState Initialized");
    // fetchCartItems();

    
    //firestoreService.getCurrentTime();
  }
   Future<void> fetchCurrentLocation() async {
    print("CURRENT LOCATION FETCH $_currentPosition");
    try {
      if (_currentPosition == null || _currentPosition.latitude == 0.0) {
        final Geolocator geolocator = Geolocator();

        print(
            "userData object in fetch current location: ${userData.fullName}");

        var currentPos = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        // getCurrentPosition(
        //   desiredAccuracy: LocationAccuracy.high,
        // );
        _currentPosition = _userData == null
            ? LatLng(0, 0)
            : _userData.userLocation != null
                ? LatLng(_userData.userLocation.customerLatLng.latitude,
                    _userData.userLocation.customerLatLng.longitude)
                : LatLng(currentPos.latitude, currentPos.longitude);
        var coordinates =
            Coordinates(currentPos.latitude, currentPos.longitude);
        var addressName =
            await Geocoder.local.findAddressesFromCoordinates(coordinates);
        var featureName = addressName.first.featureName;
        var addressLine = addressName.first.addressLine;
        // var googleAddress = await Geocoder.google(goolePlaceApiKey,language: ).findAddressesFromCoordinates(coordinates);
        // print("address from google : ${googleAddress.first.featureName} : ${googleAddress.first.addressLine}");
        location.text = "$featureName : $addressLine";
        print(
            "location Lat ${currentPos.latitude}: \n location long:${currentPos.longitude}");
        notifyListeners();
      }
    } catch (error) {
      print("current location function ERROR : $error");
      _currentPosition = _userData == null
          ? LatLng(0, 0)
          : _userData.userLocation != null
              ? LatLng(_userData.userLocation.customerLatLng.latitude,
                  _userData.userLocation.customerLatLng.longitude)
              : LatLng(0, 0);
      notifyListeners();
    }
    print("current position LATLNG: $_currentPosition ");
  }
 
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
   
  }

 

