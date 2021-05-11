import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:gmap/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;


class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  GeoFlutterFire geo = GeoFlutterFire();
  FirebaseAuth userData = FirebaseAuth.instance;

  

  Future<bool> addLocation(
      {String userId,
      CustomerLocation locationDetail,
      bool updateFunctionality}) async {
    print(
        "Lat: ${locationDetail.customerLatLng.latitude} || Long: ${locationDetail.customerLatLng.longitude}");
    try {
      GeoFirePoint location = geo.point(
          latitude: locationDetail.customerLatLng.latitude,
          longitude: locationDetail.customerLatLng.longitude);
      String locationType = locationDetail.otherLocation
          ? locationDetail.otherLocationName
          : locationDetail.locationType;

      if (updateFunctionality) {
        await _db
            .collection(
                "grocery/customers/customersList/$userId/customerLocations")
            .doc(locationDetail.locationId)
            .update({
          'area': locationDetail.area,
          'houseNo': locationDetail.houseNo,
          'landmark': locationDetail.landMark,
          'locationType': locationType,
          'location': locationDetail.location,
          'locationPoint': location.data,
          'quickLocation': locationDetail.quickLocation,
        });
      } else {
        _db
            .collection(
                "grocery/customers/customersList/$userId/customerLocations")
            .add({
          'area': locationDetail.area,
          'houseNo': locationDetail.houseNo,
          'landmark': locationDetail.landMark,
          'locationType': locationType,
          'location': locationDetail.location,
          'locationPoint': location.data,
          'quickLocation': locationDetail.quickLocation,
        }).then((value) {
          _db.collection("grocery/customers/customersList").doc(userId).update({
            'area': locationDetail.area,
            'houseNo': locationDetail.houseNo,
            'landmark': locationDetail.landMark,
            'locationType': locationType,
            'location': locationDetail.location,
            'locationPoint': location.data,
            'quickLocation': locationDetail.quickLocation,
          });
        });
      }
      return true;
    } catch (e) {
      print("error while adding location : $e");
      return false;
    }
  }

  Future<bool> deleteCustomerLocation(String locationId, String userId) async {
    try {
      await _db
          .collection(
              "grocery/customers/customersList/$userId/customerLocations")
          .doc(locationId)
          .delete();
      return true;
    } catch (e) {
      print("Error while delete location: $e");
      return false;
    }
  }

  Future<List<CustomerLocation>> fetchCustomerLocations(String userId) async {
    try {
      var response = await _db
          .collection(
              "grocery/customers/customersList/$userId/customerLocations")
          .where("quickLocation", isEqualTo: false)
          .get();
      return response.docs
          .map((e) => CustomerLocation.fromSnapshot(e))
          .toList();
    } catch (e) {
      List<CustomerLocation> nullData = [CustomerLocation()];
      print("Error while fetching customers location: $e");
      return nullData;
    }
  }

  Future<bool> updateDeliveryLocation(
      String userId, CustomerLocation locationDetail) async {
    try {
      GeoFirePoint location = geo.point(
          latitude: locationDetail.customerLatLng.latitude,
          longitude: locationDetail.customerLatLng.longitude);
      //String locationType = locationDetail.otherLocation ? locationDetail.otherLocationName : locationDetail.locationType;
      await _db
          .collection("grocery/customers/customersList")
          .doc(userId)
          .update({
        'area': locationDetail.area,
        'houseNo': locationDetail.houseNo,
        'landmark': locationDetail.landMark,
        'locationType': locationDetail.locationType,
        'location': locationDetail.location,
        'locationPoint': location.data,
        'quickLocation': locationDetail.quickLocation,
      });
      return true;
    } catch (e) {
      print("Error while updating location : $e");
      return false;
    }
  }

  
}
